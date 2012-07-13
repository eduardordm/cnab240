module Cnab240
	class SegmentoW1 < BinData::Record

		include Cnab240::DefaultMixin
		
		string :identificador_tributo, :length => 2, :pad_byte => ' '
		string :receita, :length => 6, :pad_byte => ' '
		string :tipo_identificacao_contribuinte, :length => 2, :pad_byte => ' '
		string :identificacao_contribuinte, :length => 14, :pad_byte => ' '
		string :identificador_fgts, :length => 16, :pad_byte => ' '
		string :lacre_conectividade, :length => 9, :pad_byte => ' '
		string :digito_lacre_conectividade, :length => 2, :pad_byte => ' '
		string :cnab_g004_1, :length => 1, :pad_byte => ' '

	end
end