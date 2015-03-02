module Cnab240::V40
  class SegmentoA < BinData::Record
    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    lstring :controle_banco, length: 3, pad_byte: '0'
    lstring :controle_lote, length: 4, pad_byte: '0'
    lstring :controle_registro, length: 1, initial_value: '3', pad_byte: '0'

    lstring :servico_numero_registro, length: 5, pad_byte: '0'
    string :servico_codigo_segmento, length: 1, initial_value: 'A', pad_byte: ' '
    lstring :servico_codigo_movimento, length: 3, pad_byte: '0'

    lstring :favorecido_camara, length: 3, pad_byte: '0'
    lstring :favorecido_banco, length: 3, pad_byte: '0'
    string :brancos_1, length: 1, pad_byte: '0'

    lstring :favorecido_agencia_codigo, length: 4, pad_byte: '0'
    string :brancos_2, length: 1, pad_byte: ' '
    string :brancos_3, length: 7, pad_byte: '0'

    lstring :favorecido_conta_numero, length: 5, pad_byte: '0'
    string :brancos_4, length: 1, pad_byte: ' '
    string :favorecido_agencia_conta_dv, length: 1, pad_byte: ' '
    string :favorecido_nome, length: 30, pad_byte: ' '

    string :credito_seu_numero, length: 15, pad_byte: ' '
    string :brancos_5, length: 5, pad_byte: ' '
    lstring :credito_data_pagamento, length: 8, pad_byte: '0'
    string :credito_moeda_tipo, length: 3, pad_byte: ' '
    lstring :credito_moeda_quantidade, length: 15, pad_byte: '0'
    lstring :credito_valor_pagamento, length: 15, pad_byte: '0'
    string :credito_nosso_numero, length: 20, pad_byte: ' '
    lstring :credito_data_real, length: 8, pad_byte: '0'
    lstring :credito_valor_real, length: 15, pad_byte: '0'

    string :tipo_mora, length: 2, pad_byte: '0'
    string :valor_mora, length: 17, pad_byte: '0'

    string :complemento, length: 16, pad_byte: ' '
    string :brancos_6, length: 4, pad_byte: ' '
    string :numero_inscricao, length: 14, pad_byte: ' '

    string :ocorrencias, length: 10, pad_byte: ' '
  end
end
