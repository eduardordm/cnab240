module Cnab240::V86
	class SegmentoN < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		lstring :controle_banco, :length => 3, :pad_byte => '0'
		lstring :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

		lstring :servico_numero_registro, :length => 5, :pad_byte => '0'
		string :servico_codigo_segmento, :length => 1, :initial_value  => 'N', :pad_byte => ' '
		lstring :servico_tipo_movimento, :length => 1, :pad_byte => '0'
		lstring :servico_codigo_movimento, :length => 2, :pad_byte => '0'

		string :seu_numero, :length => 20, :pad_byte => ' '
		string :nosso_numero, :length => 20, :pad_byte => ' '
		string :contribuinte, :length => 30, :pad_byte => ' '
		lstring :data_pagamento, :length => 8, :pad_byte => '0'
		lstring :valor_pagamento, :length => 15, :pad_byte => '0'

	#	string :informacoes_complementares, :length => 120, :pad_byte => ' '
		choice :n_complemento, :selection => :get_n do
			string 0, :length => 120, :pad_byte => ' '
            segmento_n1 1
            segmento_n1 2
            segmento_n3 3
            segmento_n4 4
            segmento_n5 5
            segmento_n6 6
            segmento_n7 7
            segmento_n8 8
    	end 

		string :ocorrencias, :length => 10, :pad_byte => ' ' 

		def get_n
			servico_forma_nX = {
				'00' => 0,
				'17' => 1,
				'16' => 2,
				'18' => 3,
				'22' => 4,
				'23' => 4,
				'24' => 4,
				'25' => 5,
				'27' => 6,
				'26' => 7,
				'21' => 8
   			}
   			begin
   				servico_forma = lote.header.servico_forma
   			rescue
   				servico_forma = '00'
   			end
			return servico_forma_nX[servico_forma]
		end

	end
end