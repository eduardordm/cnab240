module Cnab240::Pagamentos
	class Trailer < BinData::Record
		
		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3
		string :controle_lote, :length => 4
		string :controle_registro, :value => '5'

		string :cnab_g004_1, :length => 9
		string :totais_qtde_registros, :length => 6
		string :totais_valor, :length => 18
		string :totais_qtde_moeda, :length => 18
		string :numero_aviso_debito, :length => 6
		string :cnab_g004_2, :length => 165
		string :ocorrencias, :length => 10
	end
end