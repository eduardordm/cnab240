module Cnab240
	class PagamentoItau

		include Cnab240::Filler
	
		attr_accessor :arquivo	

		def initialize(campos = {})
			@arquivo = Cnab240::Arquivo::Arquivo.new('V40')
			# header e trailer arquivo
			campos[:controle_banco] = '341'
			campos[:banco_nome] = 'BANCO ITAU'
			campos[:arquivo_codigo] = '1'
			campos[:arquivo_data_geracao] = Time.now.strftime("%d%m%Y") 
			campos[:arquivo_hora_geracao] = Time.now.strftime("%H%M") 

			fill campos, arquivo.header, arquivo.trailer
		end


		def add(campos = {})
			@arquivo.lotes << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V40')

			# header e trailer lote
			campos[:controle_banco] = '341'
			campos[:servico_operacao] = 'D'
			campos[:servico_tipo] = '05'
			campos[:servico_forma] = '50'
			campos[:servico_codigo_movimento] = '000'
			campos[:servico_numero_registro] = '00001'
			campos[:credito_moeda_tipo] = 'REA'
			campos[:totais_qtde_registros] = '000003'
			campos[:favorecido_banco] = '341'

			campos[:controle_lote] = @arquivo.lotes.length.to_s

			if campos[:valor] 
				campos[:credito_valor_pagamento] = campos[:valor]
				campos[:credito_valor_real] = campos[:valor]
			end

			if campos[:data] 
				campos[:credito_data_pagamento]  = campos[:data]
				campos[:credito_data_real] = campos[:data]
			end

			fill campos, lote.header, lote.trailer, lote.segmento_a
		end

		def string
			arquivo.string
		end

		def save_to_file(filename)
			arquivo.save_to_file(filename)
		end

	end

end