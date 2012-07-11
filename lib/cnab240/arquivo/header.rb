module Cnab240::Arquivo
	class Header < BinData::Record
		
		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3
		string :controle_lote, :value => '0000'
		string :controle_registro, :value => '0'

		string :cnab_g004_1, :length => 9

		string :empresa_tipo, :length => 1
		string :empresa_numero, :length => 14
		string :empresa_convenio, :length => 20
		string :empresa_agencia_codigo, :length => 5
		string :empresa_agencia_dv, :length => 1
		string :empresa_conta_numero, :length => 12
		string :empresa_conta_dv, :length => 1
		string :empresa_agencia_conta_dv, :length => 1
		string :empresa_nome, :length => 30

		string :banco_nome, :length => 30

		string :cnab_g004_2, :length => 10

		string :arquivo_codigo, :length => 1
		string :arquivo_data_geracao, :length => 8
		string :arquivo_hora_geracao,:length => 6
		string :arquivo_sequencia, :length => 6
		string :arquivo_layout, :value => '085'
		string :arquivo_densidade, :length => 5

		string :reservado_banco, :length => 20
		string :reservado_empresa, :length => 20

		string :cnab_g004_3, :length => 29

	end
end