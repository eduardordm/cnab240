module Cnab240
	class SegmentoN < BinData::Record

		include Cnab240::DefaultMixin
		
		string :controle_banco, :length => 3, :pad_byte => '0'
		string :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

		string :servico_numero_registro, :length => 5, :pad_byte => '0'
		string :servico_codigo_segmento, :value => 'N', :pad_byte => ' '
		string :servico_tipo_movimento, :length => 1, :pad_byte => '0'
		string :servico_codigo_movimento, :length => 2, :pad_byte => '0'

		string :seu_numero, :length => 20, :pad_byte => ' '
		string :nosso_numero, :length => 20, :pad_byte => ' '
		string :contribuinte, :length => 30, :pad_byte => ' '
		string :data_pagamento, :length => 8, :pad_byte => '0'
		string :valor_pagamento, :length => 15, :pad_byte => '0'

		string :informacoes_complementares, :length => 120, :pad_byte => ' '

		string :ocorrencias, :length => 10, :pad_byte => ' '

	end
end