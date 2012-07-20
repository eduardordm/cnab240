module Cnab240::V86
	class SegmentoN8 < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		string :receita, :length => 6, :pad_byte => ' '
		string :tipo_identificacao_contribuinte, :length => 2, :pad_byte => '0'
		string :identificacao_contribuinte, :length => 14, :pad_byte => '0'


		string :ie_munic_declar, :length => 8, :pad_byte => ' '
		
		string :origem, :length => 16, :pad_byte => '0'
		string :valor_principal, :length => 15, :pad_byte => '0'
		string :atualizacao_monetaria, :length => 15, :pad_byte => ' '
		string :valor_mora, :length => 15, :pad_byte => '0'
		string :valor_multa, :length => 15, :pad_byte => ' '
		string :data_vencimento, :length => 8, :pad_byte => ' '
		string :periodo_parcela, :length => 6, :pad_byte => ' '



	end
end