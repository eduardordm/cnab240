module Cnab240::V86
	class SegmentoN1 < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		string :receita, :length => 6, :pad_byte => ' '
		string :tipo_identificacao_contribuinte, :length => 2, :pad_byte => '0'
		string :identificacao_contribuinte, :length => 14, :pad_byte => '0'
		string :identificacao_tributo, :length => 2, :pad_byte => ' '
		
		string :mes_ano_competencia, :length => 6, :pad_byte => '0'
		string :valor_tributo, :length => 15, :pad_byte => '0'
		string :valor_outras_entidades, :length => 15, :pad_byte => '0'
		string :atualizacao_monetaria, :length => 15, :pad_byte => '0'

		string :cnab, :length => 45, :pad_byte => ' '


	end
end