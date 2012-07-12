module Cnab240
	class SegmentoA < BinData::Record

		include Cnab240::DefaultMixin
		
		string :controle_banco, :length => 3, :pad_byte => '0'
		string :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

		string :servico_numero_registro, :length => 5, :pad_byte => '0'
		string :servico_codigo_segmento, :value => 'A', :pad_byte => ' '
		string :servico_tipo_movimento, :length => 1, :pad_byte => '0'
		string :servico_codigo_movimento, :length => 2, :pad_byte => '0'

		string :favorecido_camara, :length => 3, :pad_byte => '0'
		string :favorecido_banco, :length => 3, :pad_byte => '0'
		string :favorecido_agencia_codigo, :length => 5, :pad_byte => '0'
		string :favorecido_agencia_dv, :length => 1, :pad_byte => ' '
		string :favorecido_conta_numero, :length => 12, :pad_byte => '0'
		string :favorecido_conta_dv, :length => 1, :pad_byte => ' '
		string :favorecido_agencia_conta_dv, :length => 1, :pad_byte => ' '
		string :favorecido_nome, :length => 30, :pad_byte => ' '

		string :credito_seu_numero, :length => 20, :pad_byte => ' '
		string :credito_data_pagamento, :length => 8, :pad_byte => '0'
		string :credito_moeda_tipo, :length => 3, :pad_byte => ' '
		string :credito_moeda_quantidade, :length => 15, :pad_byte => '0'
		string :credito_valor_pagamento, :length => 15, :pad_byte => '0'
		string :credito_nosso_numero, :length => 20, :pad_byte => ' '
		string :credito_data_real, :length => 8, :pad_byte => '0'
		string :credito_valor_real, :length => 15, :pad_byte => '0'

		string :informacao_2, :length => 40, :pad_byte => ' '

		string :codigo_finalidade_doc, :length => 2, :pad_byte => ' '
		string :codigo_finalidade_ted, :length => 5, :pad_byte => ' '
		string :codigo_finalidade_complementar, :length => 2, :pad_byte => ' '

		string :cnab_g004_1, :length => 3, :pad_byte => ' '
		string :aviso, :length => 1, :pad_byte => '0'
		string :ocorrencias, :length => 10, :pad_byte => ' '

	end
end