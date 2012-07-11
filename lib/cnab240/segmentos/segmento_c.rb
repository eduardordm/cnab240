module Cnab240
	class SegmentoC < BinData::Record

		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3
		string :controle_lote, :length => 4
		string :controle_registro, :length => 1, :initial_value => '3'

		string :servico_numero_registro, :length => 5
		string :servico_codigo_segmento, :value => 'C'
		
		string :cnab240_g004_1, :length => 3

		string :complementar_valor_ir, :length => 15
		string :complementar_valor_iss, :length => 15
		string :complementar_valor_iof, :length => 15
		string :complementar_valor_outras_deducoes, :length => 15
		string :complementar_valor_outros_acrescimos, :length => 15

		string :substituta_agencia, :length => 5
		string :substituta_agencia_dv, :length => 1
		string :substituta_numero_cc, :length => 12
		string :substituta_conta_dv, :length => 1
		string :substituta_agencia_conta_dv, :length => 1

		string :valor_inss, :length => 15

		string :cnab_g004_2, :length => 113
		
	end
end