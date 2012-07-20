module Cnab240
	class Remessa
	
		attr_accessor :arquivo
		
		def initialize(campos = {})
			@arquivo = Cnab240::Arquivo::Arquivo.new
		end


		def add(operacao, campos = {})
			raise "Operacao invalida" if ESTRUTURA[:operacao].nil?
			@arquivo.lotes << lote = Cnab240::Lote.new(:operacao => campos[:operacao], :tipo => :remessa)
			campos.each do |k,v|
				lote.header.send("#{k}=", v) if lote.header.respond_to?("#{k}=")
				
				lote.trailer.send("#{k}=", v) if lote.trailer.respond_to?("#{k}=") 
			end 
		end

		def string
		end

		def save_to_file
		end

	end

end