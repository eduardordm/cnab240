module Cnab240::V83
  class SegmentoB < BinData::Record

    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    lstring :controle_banco, :length => 3, :pad_byte => '0'
    lstring :controle_lote, :length => 4, :pad_byte => '0'
    lstring :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

    lstring :servico_numero_registro, :length => 5, :pad_byte => '0'
    string :servico_codigo_segmento, :length => 1, :initial_value => 'B', :pad_byte => ' '

    string :cnab240_g004_1, :length => 3, :pad_byte => ' '

    lstring :favorecido_inscricao_tipo, :length => 1, :pad_byte => '0'
    lstring :favorecido_inscricao_numero, :length => 14, :pad_byte => '0'
    string :favorecido_endereco_logradouro, :length => 30, :pad_byte => ' '
    lstring :favorecido_endereco_numero, :length => 5, :pad_byte => '0'
    string :favorecido_endereco_complemento, :length => 15, :pad_byte => ' '
    string :favorecido_endereco_bairro, :length => 15, :pad_byte => ' '
    string :favorecido_endereco_cidade, :length => 20, :pad_byte => ' '
    lstring :favorecido_endereco_cep, :length => 8, :pad_byte => '0'
    string :favorecido_endereco_estado, :length => 2, :pad_byte => ' '

    lstring :pagamento_data_vencimento, :length => 8, :pad_byte => '0'
    lstring :pagamento_valor_documento, :length => 15, :pad_byte => '0'
    lstring :pagamento_valor_abatimento, :length => 15, :pad_byte => '0'
    lstring :pagamento_valor_desconto, :length => 15, :pad_byte => '0'
    lstring :pagamento_valor_mora, :length => 15, :pad_byte => '0'
    lstring :pagamento_valor_multa, :length => 15, :pad_byte => '0'

    string :time_of_ted_remittence, :length => 4, :pad_byte => '0'
    string :filler, :length => 11, :pad_byte => ' '
    string :historic_code, :length => 4, :pad_byte => '0'

    lstring :aviso, :length => 1, :pad_byte => '0'
    lstring :accurence_of_return, :length => 10, :pad_byte => ' '
  end
end