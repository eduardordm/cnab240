module Cnab240
	class PagamentoItau
	
		attr_accessor :arquivo
	
		attr_accessor :campos_arquivo		

		def initialize(campos = {})
			@campos_arquivo = campos
			@arquivo = Cnab240::Arquivo::Arquivo.new('V40')
			arquivo.header.controle_banco = '341'
			arquivo.header.banco_nome = 'BANCO ITAU'
			arquivo.header.arquivo_codigo = '1'

			t = Time.now
			arquivo.header.arquivo_data_geracao = t.strftime("%d%m%Y") 
			arquivo.header.arquivo_hora_geracao = t.strftime("%H%M") 

			campos.each do |k,v|
				arquivo.header.send("#{k}=", v) if arquivo.header.respond_to?("#{k}=")
				arquivo.trailer.send("#{k}=", v) if arquivo.trailer.respond_to?("#{k}=") 
			end 

		end


		def add(campos = {})
			@arquivo.lotes << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V40')
			
			campos_arquivo.each do |k,v|
				lote.header.send("#{k}=", v) if lote.header.respond_to?("#{k}=")
				lote.trailer.send("#{k}=", v) if lote.trailer.respond_to?("#{k}=") 
			end 

			campos.each do |k,v|
				lote.header.send("#{k}=", v) if lote.header.respond_to?("#{k}=")
				lote.segmento_a.send("#{k}=", v) if lote.segmento_a.respond_to?("#{k}=")
				lote.trailer.send("#{k}=", v) if lote.trailer.respond_to?("#{k}=") 
			end 
		end

		def string
		end

		def save_to_file
		end

	end

end