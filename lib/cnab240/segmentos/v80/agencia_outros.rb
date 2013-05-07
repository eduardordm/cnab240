module Cnab240::V80
	class AgenciaOutros < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin

		lstring :favorecido_agencia, :length => 5, :pad_byte => '0'
		string :brancos_1, :length => 1, :pad_byte => ' '
		lstring :favorecido_conta, :length => 12, :pad_byte => '0'
		string :agencia_conta_complemento, :length => 1, :pad_byte => ' '
		lstring :favorecido_agencia_conta_dv, :length => 1, :pad_byte => '0'
		
	end
end