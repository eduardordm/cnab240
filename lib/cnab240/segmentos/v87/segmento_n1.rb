module Cnab240::V87
  class SegmentoN1 < BinData::Record
    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    string :receita, length: 6, pad_byte: ' '
    lstring :tipo_identificacao_contribuinte, length: 2, pad_byte: '0'
    lstring :identificacao_contribuinte, length: 14, pad_byte: '0'
    string :identificacao_tributo, length: 2, pad_byte: ' '

    lstring :mes_ano_competencia, length: 6, pad_byte: '0'
    lstring :valor_tributo, length: 15, pad_byte: '0'
    lstring :valor_outras_entidades, length: 15, pad_byte: '0'
    lstring :atualizacao_monetaria, length: 15, pad_byte: '0'

    string :cnab, length: 45, pad_byte: ' '
  end
end
