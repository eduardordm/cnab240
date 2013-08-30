module Cnab240
	class Builder

		HEADER_ARQUIVO = '0'
		HEADER_LOTE = '1'
		INICIAIS_LOTE = '2'
		DETALHE = '3'
		FINAIS_LOTE = '4'
		TRAILER_LOTE = '5'
		TRAILER_ARQUIVO = '9'

		RANGE_TIPO_REGISTRO = 7..7
		RANGE_LAYOUT_ARQUIVO = 163..165
		RANGE_HEADER_LOTE = 13..15
		RANGE_TIPO_OPERACAO_DETALHE = 13..13

		attr_accessor :arquivos

		def initialize(filename = nil, version = nil)
			load_from_file(filename, version) unless filename.nil?
		end

		def load_from_file(filename, version = nil)
			@arquivos = []
			line_number = 0
			File.open(filename, "r").each_line do |line|
				check_line_encoding line, ++line_number
				case line[RANGE_TIPO_REGISTRO]

				when HEADER_ARQUIVO
					find_header_arquivo line, line_number, version

				when HEADER_LOTE
					find_header_lote line, line_number, version

				when INICIAIS_LOTE
					raise NotImplementedError.new("Tipo de registro nao suportado")

				when DETALHE
					find_segmento line, line_number

				when FINAIS_LOTE
					raise NotImplementedError.new("Tipo de registro not implemented")

				when TRAILER_LOTE
					arquivos.last.lotes.last.trailer.read(line) 

				when TRAILER_ARQUIVO
          arquivos.last.trailer.read(line)

				else
					raise "Invalid tipo de registro: #{line[RANGE_TIPO_REGISTRO]} at line #{line_number} \n\t Line: [#{line}]"
				end
			end
			arquivos
		end

		private

		def check_line_encoding(line, line_number = -1)
			line = line.force_encoding("US-ASCII").encode("UTF-8", :invalid=>:replace) if line.respond_to?(:force_encoding)
			line.gsub!("\r", "")
			line.gsub!("\n", "")
			raise "Invalid line length: #{line.length} expected 240 at line number #{line_number}\n\t Line: [#{line}]" unless line.length == 240
			line
		end

		def find_header_arquivo(line, line_number = -1, version = nil)
			arquivos << Cnab240::Arquivo::Arquivo.new
      if version
        arquivos.last.versao = version
        arquivos.last.header = eval("Cnab240::#{version}::Arquivo::Header").read(line)
        return
      end
			case line[RANGE_LAYOUT_ARQUIVO]
			# when '080'
			# 	arquivos.last.versao = 'V80'
			# 	arquivos.last.header = Cnab240::V80::Arquivo::Header.read(line)	
			when '085'
				arquivos.last.versao = 'V86'
				arquivos.last.header = Cnab240::V86::Arquivo::Header.read(line)
			when '040'
				arquivos.last.versao = 'V40'
				arquivos.last.header = Cnab240::V40::Arquivo::Header.read(line)
			when '000' # possivelmente V80 do itau
				if line[14..16] == '080' 
					arquivos.last.versao = 'V80'
					arquivos.last.header = Cnab240::V80::Arquivo::Header.read(line)		
				else
					raise "Versao de arquivo nao suportado: #{line[RANGE_LAYOUT_ARQUIVO]} na linha #{line_number}" if Cnab240.fallback == false
					arquivos.last.versao = 'V86'
					arquivos.last.header = Cnab240::V86::Arquivo::Header.read(line)
        end
			else
				raise "Versao de arquivo nao suportado: #{line[RANGE_LAYOUT_ARQUIVO]} na linha #{line_number}" if Cnab240.fallback == false
				arquivos.last.versao = 'V86'
				arquivos.last.header = Cnab240::V86::Arquivo::Header.read(line)
			end
		end

		def find_header_lote(line, line_number = -1, version = nil)
      if version
        arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none, :versao => version) do |l|
          l.header = eval("Cnab240::#{version}::Pagamentos::Header").read(line)
        end
        return
      end
			case line[RANGE_HEADER_LOTE]
			when '080'
				arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none, :versao => 'V80') do |l|
					l.header = Cnab240::V80::Pagamentos::Header.read(line)
				end		
			when '030'
				case arquivos.last.versao
				when 'V80'
					arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none) do |l|
						l.header = Cnab240::V80::Pagamentos::Header.read(line)
					end	
				when 'V40'
					arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none) do |l|
						l.header = Cnab240::V40::Pagamentos::Header.read(line)
					end	
				else
					raise "Header de lote nao suportado para a versao de arquivo." 	
				end
			when '044' 
				arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none) do |l|
					l.header = Cnab240::V86::Pagamentos::Header.read(line)
				end
			when '040'
				case arquivos.last.versao
				when 'V80'
					arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :none) do |l|
						l.header = Cnab240::V80::Pagamentos::Header.read(line)
					end
				when 'V86'
					arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento_titulo_cobranca, :tipo => :none) do |l|
						l.header = Cnab240::V86::PagamentosTitulos::Header.read(line)
					end
				else
					raise "Header de lote nao suportado para a versao de arquivo." 	
				end
			when '011'
				arquivos.last.lotes << Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :none) do |l|
					l.header = Cnab240::V86::PagamentosTributos::Header.read(line)
				end
			else
				raise "Tipo de lote nao suportado: #{line[RANGE_HEADER_LOTE]} na linha #{line_number}" 
			end
		end

		def find_segmento(line, line_number = -1)
			raise "Invalid segmento de lote: #{line[RANGE_TIPO_OPERACAO_DETALHE]} at line #{line_number}" unless ESTRUTURA[arquivos.last.versao][:segmentos_implementados].include? line[RANGE_TIPO_OPERACAO_DETALHE].downcase.intern
			case line[RANGE_TIPO_OPERACAO_DETALHE]
			when 'J'
				if line[17..18] == '52'
					arquivos.last.lotes.last.read_segmento('J52', line)
				else
					arquivos.last.lotes.last.read_segmento('J', line)
				end
			else
				arquivos.last.lotes.last.read_segmento(line[RANGE_TIPO_OPERACAO_DETALHE], line)
			end
		end

	end
end