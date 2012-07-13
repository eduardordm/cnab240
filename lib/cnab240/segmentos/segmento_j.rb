module Cnab240
	class SegmentoJ < BinData::Record

		include Cnab240::DefaultMixin
		
		string :controle_banco, :length => 3, :pad_byte => '0'
		string :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

		string :servico_numero_registro, :length => 5, :pad_byte => '0'
		string :servico_codigo_segmento, :value => 'J', :pad_byte => ' '
		string :servico_tipo_movimento, :length => 1, :pad_byte => '0'
		string :servico_codigo_movimento, :length => 2, :pad_byte => '0'

		string :codigo_barras, :length => 44, :pad_byte => ' '
		string :nome_cedente, :length => 30, :pad_byte => ' '
		string :data_vencimento, :length => 8, :pad_byte => '0'
		string :valor_titulo, :length => 15, :pad_byte => '0'
		string :valor_desconto_abatimento, :length => 15, :pad_byte => '0'
		string :valor_mora_juros, :length => 15, :pad_byte => '0'
		string :data_pagamento, :length => 8, :pad_byte => '0'
		string :valor_pagamento, :length => 15, :pad_byte => '0'
		string :quantidade_moeda, :length => 15, :pad_byte => '0'
		string :referencia_sacado, :length => 20, :pad_byte => ' '

		string :nosso_numero, :length => 20, :pad_byte => ' '
		string :codigo_moeda, :length => 2, :pad_byte => '0'

		string :cnab_g004_1, :length => 6, :pad_byte => ' '
		string :ocorrencias, :length => 10, :pad_byte => ' '

	end
end