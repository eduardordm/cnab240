module Cnab240::Arquivo
	class Trailer < BinData::Record
		
		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3
		string :controle_lote, :value => '9999'
		string :controle_registro,  :value => '9'

		string :cnab_g004_1, :length => 9

		string :totais_qtde_lotes, :length => 6
		string :totais_qtde_registros, :length => 6
		string :totais_qtde_contas_concil, :length => 6

		string :cnab_g004_2, :length => 205
	end
end