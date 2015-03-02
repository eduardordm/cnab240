module Cnab240::V80
  class AgenciaItau < BinData::Record
    include Cnab240::DefaultMixin
    include Cnab240::SegmentoMixin

    lstring :zeros_1, length: 1, pad_byte: '0'
    lstring :favorecido_agencia, length: 4, pad_byte: '0'
    string :brancos_1, length: 1, pad_byte: ' '
    lstring :zeros_2, length: 6, pad_byte: '0'
    lstring :favorecido_conta, length: 6, pad_byte: '0'
    string :brancos_2, length: 1, pad_byte: ' '
    lstring :favorecido_agencia_conta_dv, length: 1, pad_byte: '0'
  end
end
