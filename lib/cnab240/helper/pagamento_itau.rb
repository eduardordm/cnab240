module Cnab240
	class PagamentoItau

		include Cnab240::Filler
	
		attr_accessor :arquivo	

		def initialize(campos = {})
			@arquivo = Cnab240::Arquivo::Arquivo.new('V80')
			# header e trailer arquivo
			campos[:controle_banco] ||= '341'
			campos[:arquivo_codigo] ||= '1'
			campos[:banco_nome] ||= 'BANCO ITAU'
			campos[:arquivo_data_geracao] ||= Time.now.strftime("%d%m%Y") 
			campos[:arquivo_hora_geracao] ||= Time.now.strftime("%H%M") 

			fill campos, arquivo.header, arquivo.trailer
		end


		def add(campos = {})
			@arquivo.lotes << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V80')

			campos[:header] ||= {}
			campos[:trailer] ||= {}
			campos[:segmento_a] ||= {}

			campos[:header][:controle_banco] ||= '341'
			campos[:header][:servico_operacao] ||= 'C'
			campos[:header][:controle_lote] ||= @arquivo.lotes.length.to_s

			campos[:segmento_a][:controle_banco] ||= '341'
			campos[:segmento_a][:controle_lote] ||= @arquivo.lotes.length.to_s
			campos[:segmento_a][:servico_numero_registro] ||= '1'
			campos[:segmento_a][:servico_tipo_movimento] ||= '000'
			campos[:segmento_a][:credito_moeda_tipo] ||= 'REA'
			campos[:trailer][:totais_qtde_registros] ||= '000003'

			fill! campos[:header], lote.header
			fill! campos[:segmento_a], lote.segmento_a
			fill! campos[:trailer], lote.trailer
		end

		def string
			arquivo.string
		end

		def save_to_file(filename)
			arquivo.save_to_file(filename)
		end

	end

end