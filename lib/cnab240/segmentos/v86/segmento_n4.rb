module Cnab240::V86
	class SegmentoN4 < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		string :receita, :length => 6, :pad_byte => ' '
		string :tipo_identificacao_contribuinte, :length => 2, :pad_byte => '0'
		string :identificacao_contribuinte, :length => 14, :pad_byte => '0'
		string :identificacao_tributo, :length => 2, :pad_byte => ' '
		
		string :vencimento, :length => 8, :pad_byte => '0'
		string :ie_munic_declar, :length => 12, :pad_byte => '0'
		string :divida_ativa_etiqueta, :length => 13, :pad_byte => '0'
		string :periodo_referencia, :length => 6, :pad_byte => '0'
		string :numero_parcela_notificacao, :length => 13, :pad_byte => '0'
		string :valor_receita, :length => 15, :pad_byte => '0'
		string :valor_juros_encargos, :length => 14, :pad_byte => '0'
		string :valor_multa, :length => 14, :pad_byte => '0'

		string :cnab, :length => 1, :pad_byte => ' '


	end
end