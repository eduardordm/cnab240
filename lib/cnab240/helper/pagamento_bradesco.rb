module Cnab240
	class PagamentoBradesco

		include Cnab240::Filler
	
		attr_accessor :arquivo	

		def initialize(campos = {})

			campos[:controle_banco] ||= '237'
			campos[:arquivo_codigo] ||= '1'
			campos[:banco_nome] ||= 'BANCO BRADESCO'
			campos[:arquivo_data_geracao] ||= Time.now.strftime("%d%m%Y") 
			campos[:arquivo_hora_geracao] ||= Time.now.strftime("%H%M") 

			@arquivo = Cnab240::Arquivo::Arquivo.new('V80')
			@arquivo.lotes << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V80')

			fill campos, arquivo.header, arquivo.trailer

			campos[:servico_operacao] ||= 'C'
			campos[:controle_lote] ||= '0001'

			fill campos, lote.header, lote.trailer

		end

		def add_lote(campos = {})
			@arquivo.lotes << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V80')

			campos[:servico_operacao] ||= 'C'
			campos[:controle_lote] ||= '0001'

			fill campos, lote.header	
		end

		def <<(campos)
			lote = @arquivo.lotes.last

			campos[:controle_banco] ||= '237'
			campos[:controle_lote] ||= @arquivo.lotes.length.to_s
			campos[:servico_numero_registro] ||= (lote.segmentos.length+1).to_s
			campos[:servico_tipo_movimento] ||= '000'
			campos[:credito_moeda_tipo] ||= 'REA'
			campos[:totais_qtde_registros] ||= (lote.segmentos.length + 2).to_s
			
			segmento_a = Cnab240::V80::SegmentoA.new 
			fill campos, segmento_a	
			fill campos, segmento_a.favorecido_agencia_conta

			lote << segmento_a
		end

		def string
			arquivo.string
		end

		def save_to_file(filename)
			arquivo.save_to_file(filename)
		end

	end


end