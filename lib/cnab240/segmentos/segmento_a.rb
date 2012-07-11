module Cnab240
	class SegmentoA < BinData::Record

		include Cnab240::DefaultMixin
		
		string :controle_banco, :length => 3
		string :controle_lote, :length => 4
		string :controle_registro, :length => 1, :initial_value => '3'

		string :servico_numero_registro, :length => 5
		string :servico_codigo_segmento, :value => 'A'
		string :servico_tipo_movimento, :length => 1
		string :servico_codigo_movimento, :length => 2

		string :favorecido_camara, :length => 3
		string :favorecido_banco, :length => 3
		string :favorecido_agencia_codigo, :length => 5
		string :favorecido_agencia_dv, :length => 1
		string :favorecido_conta_numero, :length => 12
		string :favorecido_conta_dv, :length => 1
		string :favorecido_agencia_conta_dv, :length => 1
		string :favorecido_nome, :length => 30

		string :credito_seu_numero, :length => 20
		string :credito_data_pagamento, :length => 8
		string :credito_moeda_tipo, :length => 3
		string :credito_moeda_quantidade, :length => 15
		string :credito_valor_pagamento, :length => 15
		string :credito_nosso_numero, :length => 20
		string :credito_data_real, :length => 8
		string :credito_valor_real, :length => 15

		string :informacao_2, :length => 40

		string :codigo_finalidade_doc, :length => 2
		string :codigo_finalidade_ted, :length => 5
		string :codigo_finalidade_complementar, :length => 2

		string :cnab_g004_1, :length => 3
		string :aviso, :length => 1
		string :ocorrencias, :length => 10

	end
end