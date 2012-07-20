module Cnab240::V86
	class SegmentoN3 < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		string :receita, :length => 6, :pad_byte => ' '
		string :tipo_identificacao_contribuinte, :length => 2, :pad_byte => '0'
		string :identificacao_contribuinte, :length => 14, :pad_byte => '0'
		string :identificacao_tributo, :length => 2, :pad_byte => ' '
		
		string :periodo_apuracao, :length => 8, :pad_byte => '0'
		string :receita_bruta, :length => 15, :pad_byte => '0'
		string :percentual, :length => 7, :pad_byte => '0'
		string :valor_principal, :length => 15, :pad_byte => '0'
		string :valor_multa, :length => 15, :pad_byte => '0'
		string :valor_juros_encargos, :length => 15, :pad_byte => '0'

		string :cnab, :length => 21, :pad_byte => ' '


	end
end