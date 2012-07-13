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
				line.gsub!("\n", "")
				line_number = line_number + 1
				raise "Invalid line length: #{line.length} expected 240 at line number #{line_number}\n\t Line: [#{line}]" unless line.length == 240
				case line[7..7] # ruby 1.8.7 requires this fuck
				when '0' # header de arquivo
					arquivos << Arquivo.new
					arquivos.last.header = Header.read(line)
				when '1'
					 
				when '2'
				when '3'
				when '4'
				when '5'
				when '9'
					arquivos.last.header = Trailer.read(line)
				else
					raise "Invalid tipo de registro: #{line[7]} at line #{line_number} \n\t Line: [#{line}]"
				end
			end
			arquivos
		end
	end

end