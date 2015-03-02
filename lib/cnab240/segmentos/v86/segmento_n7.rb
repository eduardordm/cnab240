module Cnab240::V86
  class SegmentoN7 < BinData::Record
    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    string :receita, length: 6, pad_byte: ' '
    lstring :tipo_identificacao_contribuinte, length: 2, pad_byte: '0'
    lstring :identificacao_contribuinte, length: 14, pad_byte: '0'
    string :identificacao_tributo, length: 2, pad_byte: ' '

    lstring :exercicio, length: 4, pad_byte: '0'
    lstring :renavam, length: 9, pad_byte: '0'
    string :uf, length: 2, pad_byte: ' '
    lstring :municipio, length: 5, pad_byte: '0'
    string :placa, length: 7, pad_byte: ' '
    string :opcao_pagamento, length: 1, pad_byte: ' '
    string :opcao_retirada, length: 1, pad_byte: ' '
    string :cnab, length: 67, pad_byte: ' '
  end
end
