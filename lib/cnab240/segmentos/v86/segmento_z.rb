module Cnab240::V86
  class SegmentoZ < BinData::Record
    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    lstring :controle_banco, length: 3, pad_byte: '0'
    lstring :controle_lote, length: 4, pad_byte: '0'
    string :controle_registro, length: 1, initial_value: '3', pad_byte: '0'

    lstring :servico_numero_registro, length: 5, pad_byte: '0'
    string :servico_codigo_segmento, length: 1, initial_value: 'Z', pad_byte: ' '

    string :autenticacao, length: 64, pad_byte: ' '
    string :controle_bancario, length: 25, pad_byte: ' '
    string :cnab_g004_1, length: 127, pad_byte: ' '
    string :ocorrencias, length: 10, pad_byte: ' '
  end
end
