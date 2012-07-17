module Cnab240::Arquivo
	class Arquivo
		attr_accessor :header
		attr_accessor :lotes
		attr_accessor :trailer

		def initialize
			@header = Header.new
			@trailer = Trailer.new
			@lotes = []
		end


		def linhas
			a = Array.new
			a << @header.linha
			@lotes.each do |lote|
				lote.linhas.each do |linha|
					a << linha
				end
			end 
			a << @trailer.linha
			a
		end

		def string
			linhas.join("\n")
		end

		def save_to_file(filename)
			begin
				File.delete(filename) # LoL
			rescue
			end
			File.open(filename, 'w') {|f| f.write(string) }
		end

		def self.load_from_file(filename) # usar IO, blah, tanto faz :D
			arquivos = []
			line_number = 0
			File.open(filename, "r").each_line do |line|
				line = line.force_encoding("US-ASCII").encode("UTF-8", :invalid=>:replace) if line.respond_to?(:force_encoding)
				line.gsub!("\r", "")
				line.gsub!("\n", "")
				line_number = line_number + 1
				raise "Invalid line length: #{line.length} expected 240 at line number #{line_number}\n\t Line: [#{line}]" unless line.length == 240
				case line[7..7] # ruby 1.8.7 
				when '0' # header de arquivo
					arquivos << Arquivo.new
					arquivos.last.header = Header.read(line)
				when '1'
					case line[13..15]
					when '041' 
						arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none) do |l|
							l.header = Cnab240::Pagamentos::Header.read(line)
						end	
					when '044' 
						arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none) do |l|
							l.header = Cnab240::Pagamentos::Header.read(line)
						end
					when '040'
						arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento_titulo_cobranca, :tipo => :none) do |l|
							l.header = Cnab240::PagamentosTitulos::Header.read(line)
						end
					when '011'
						arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :none) do |l|
							l.header = Cnab240::PagamentosTributos::Header.read(line)
						end
					else
						raise "Tipo de lote nao suportado: #{line[13..15]} na linha #{line_number}"
					end
				when '2'
					raise NotImplementedError.new("Tipo de registro nao suportado")
				when '3' 
					raise "Invalid segmento de lote: #{line[13..13]} at line #{line_number}" unless ESTRUTURA[:segmentos_implementados].include? line[13..13].downcase.intern
					case line[13..13]
					when 'J'
						if line[17..18] == '52'
							arquivos.last.lotes.last.read_segmento('J52', line)
						else
							arquivos.last.lotes.last.read_segmento('J', line)
						end
					else
						arquivos.last.lotes.last.read_segmento(line[13..13], line)
					end
				when '4'
					raise NotImplementedError.new("Tipo de registro not implemented")
				when '5'
					arquivos.last.lotes.last.trailer.read(line) 
				when '9'
					arquivos.last.trailer = Trailer.read(line)
				else
					raise "Invalid tipo de registro: #{line[7..7]} at line #{line_number} \n\t Line: [#{line}]"
				end
			end
			arquivos
		end
	end

end