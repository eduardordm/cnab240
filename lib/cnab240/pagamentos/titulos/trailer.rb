module Cnab240::PagamentosTitulos
	class Trailer < BinData::Record
		
		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3, :pad_byte => '0'
		string :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :value => '5', :pad_byte => '0'

		string :cnab_g004_1, :length => 9, :pad_byte => '0'
		string :totais_qtde_registros, :length => 6, :pad_byte => '0'
		string :totais_valor, :length => 18, :pad_byte => '0'
		string :totais_qtde_moeda, :length => 18, :pad_byte => '0'
		string :numero_aviso_debito, :length => 6, :pad_byte => '0'
		string :cnab_g004_2, :length => 165, :pad_byte => ' '
		string :ocorrencias, :length => 10, :pad_byte => ' '
	end
end