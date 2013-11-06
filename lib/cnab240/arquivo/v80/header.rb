module Cnab240::V80::Arquivo
	class Header < BinData::Record
		
		include Cnab240::DefaultMixin

		lstring :controle_banco, :length => 3, :pad_byte => '0'
		lstring :controle_lote, :length => 4, :initial_value => '0000', :pad_byte => '0'
		lstring :controle_registro, :length => 1, :initial_value => '0', :pad_byte => '0'

		string :brancos_1, :length => 6, :initial_value => ' ', :pad_byte => ' '
		string :arquivo_layout, :length => 3, :initial_value => '080'

		lstring :empresa_tipo, :length => 1, :pad_byte => '0'
		lstring :empresa_numero, :length => 14, :pad_byte => '0'

		string :brancos_2, :length => 20, :initial_value => ' ', :pad_byte => ' '

		lstring :empresa_agencia_codigo, :length => 5, :pad_byte => '0'
		string :brancos_3, :length => 1, :initial_value => ' ', :pad_byte => ' '
		lstring :empresa_conta_numero, :length => 12, :pad_byte => '0'
		string :brancos_4, :length => 1, :initial_value => ' ', :pad_byte => ' '
		string :empresa_agencia_conta_dv, :length => 1, :pad_byte => '0'
		string :empresa_nome, :length => 30, :pad_byte => ' '
		string :banco_nome, :length => 30, :pad_byte => ' '
		string :brancos_5, :length => 10, :initial_value => ' ', :pad_byte => ' '

		lstring :arquivo_codigo, :length => 1, :pad_byte => '0'
		lstring :arquivo_data_geracao, :length => 8, :pad_byte => '0'
		lstring :arquivo_hora_geracao,:length => 6, :pad_byte => '0'
		
		#string :brancos_6, :length => 9, :initial_value => ' ', :pad_byte => '0'
		lstring :zeros_6, :length => 9, :pad_byte => '0'

		lstring :arquivo_densidade, :length => 5, :pad_byte => '0'

		string :brancos_7, :length => 69, :pad_byte => ' '

	end
end