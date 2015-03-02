module Cnab240::V86
  class SegmentoJ52 < BinData::Record
    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    lstring :controle_banco, length: 3, pad_byte: '0'
    lstring :controle_lote, length: 4, pad_byte: '0'
    string :controle_registro, length: 1, initial_value: '3', pad_byte: '0'

    lstring :servico_numero_registro, length: 5, pad_byte: '0'
    string :servico_codigo_segmento, length: 1, initial_value: 'J', pad_byte: ' '
    lstring :servico_tipo_movimento, length: 1, pad_byte: '0'
    lstring :servico_codigo_movimento, length: 2, pad_byte: '0'

    string :cod_registro_opcional, length: 2, initial_value: '52'

    lstring :sacado_tipo_inscricao, length: 1, pad_byte: '0'
    lstring :sacado_numero_inscricao, length: 15, pad_byte: '0'
    string :sacado_nome, length: 40, pad_byte: ' '

    lstring :cedente_tipo_inscricao, length: 1, pad_byte: '0'
    lstring :cedente_numero_inscricao, length: 15, pad_byte: '0'
    string :cedente_nome, length: 40, pad_byte: ' '

    lstring :sacador_tipo_inscricao, length: 1, pad_byte: '0'
    lstring :sacador_numero_inscricao, length: 15, pad_byte: '0'
    string :sacador_nome, length: 40, pad_byte: ' '

    string :cnab_g004_1, length: 53, pad_byte: ' '
  end
end
