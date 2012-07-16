module Cnab240
	class SegmentoW < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		string :controle_banco, :length => 3, :pad_byte => '0'
		string :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

		string :servico_numero_registro, :length => 5, :pad_byte => '0'
		string :servico_codigo_segmento, :length => 1, :initial_value  => 'W', :pad_byte => ' '
		string :complemento, :length => 1, :pad_byte => '0'

		string :uso_informacoes_1_e_2, :length => 1, :pad_byte => ' '
		string :informacao_1, :length => 80, :pad_byte => ' '
		string :informacao_2, :length => 80, :pad_byte => ' '

		segmento_w1 :w1

		string :reservado, :length => 2, :pad_byte => ' '
		string :ocorrencias, :length => 10, :pad_byte => ' '

	end
end