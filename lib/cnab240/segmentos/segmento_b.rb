module Cnab240
	class SegmentoB < BinData::Record

		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3
		string :controle_lote, :length => 4
		string :controle_registro, :length => 1, :initial_value => '3'

		string :servico_numero_registro, :length => 5
		string :servico_codigo_segmento, :value => 'B'

		string :cnab240_g004_1, :length => 3

		string :favorecido_inscricao_tipo, :length => 1
		string :favorecido_inscricao_numero, :length => 14
		string :favorecido_endereco_logradouro, :length => 30
		string :favorecido_endereco_numero, :length => 5
		string :favorecido_endereco_complemento, :length => 15
		string :favorecido_endereco_bairro, :length => 15
		string :favorecido_endereco_cidade, :length => 20
		string :favorecido_endereco_cep, :length => 5
		string :favorecido_endereco_cep_complemento, :length => 3
		string :favorecido_endereco_estado, :length => 2

		string :pagamento_data_vencimento, :length => 8
		string :pagamento_valor_documento, :length => 15
		string :pagamento_valor_abatimento, :length => 15
		string :pagamento_valor_desconto, :length => 15
		string :pagamento_valor_mora, :length => 15
		string :pagamento_valor_multa, :length => 15

		string :codigo_documento_favorecido, :length => 15
		string :aviso, :length => 1
		string :codigo_ug, :length => 6
		
		string :cnab_g004_2, :length => 8

	end
end