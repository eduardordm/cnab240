module Cnab240::V83::Pagamentos
	class Trailer < BinData::Record
		
		include Cnab240::DefaultMixin

		lstring :controle_banco, :length => 3, :pad_byte => '0'
		lstring :controle_lote, :length => 4, :pad_byte => '0'
		lstring :controle_registro, :length => 1, :initial_value => '5', :pad_byte => '0'

		lstring :cnab_g004_1, :length => 9, :pad_byte => ' '
		lstring :totais_qtde_registros, :length => 6, :pad_byte => '0'
		lstring :totais_valor, :length => 18, :pad_byte => '0'
		lstring :totais_qtde_moeda, :length => 18, :pad_byte => '0'
		lstring :numero_aviso_debito, :length => 6, :pad_byte => '0'
		string :cnab_g004_2, :length => 165, :pad_byte => ' '
		string :ocorrencias, :length => 10, :pad_byte => ' '
	end
end