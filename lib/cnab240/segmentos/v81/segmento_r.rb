module Cnab240
  module V81
    class SegmentoR < BinData::Record
      include Cnab240::DefaultMixin
      include Cnab240::SegmentoMixin

      lstring :controle_banco, length: 3, pad_byte: '0'
      lstring :controle_lote, length: 4, pad_byte: '0'
      string :controle_registro, length: 1, initial_value: '3', pad_byte: '0'
      lstring :servico_numero_registro, length: 5, pad_byte: '0'
      string :servico_codigo_segmento, length: 1, initial_value: 'R', pad_byte: ' '
      lstring :servico_tipo_movimento, length: 1, pad_byte: ' '
      lstring :servico_codigo_movimento, length: 2, pad_byte: '0'
      lstring :codigo_desconto_2, length: 1, pad_byte: '0' #'1'= Valor Fixo Até a Data Informada, '2'= Percentual Até a Data Informada
      lstring :data_desconto_2, length: 8, pad_byte: '0'
      lstring :valor_desconto_2, length: 15, pad_byte: '0'
      lstring :codigo_desconto_3, length: 1, pad_byte: '0' #'1'= Valor Fixo Até a Data Informada, '2'= Percentual Até a Data Informada
      lstring :data_desconto_4, length: 8, pad_byte: '0'
      lstring :valor_desconto_4, length: 15, pad_byte: '0'
      lstring :codigo_multa, length: 1, pad_byte: '0' #'1'= Valor Fixo, '2'= Percentual
      lstring :data_multa, length: 8, pad_byte: '0'
      lstring :valor_multa, length: 15, pad_byte: '0'
      string :informacao_pagador, length: 10, pad_byte: ' '

      # Mensagem 3 e 4: Texto de observações destinado ao envio de mensagens livres,
      # a serem impressas no campo de instruções da ficha de compensação do bloqueto.
      # As Mensagens 3 e 4 prevalecem sobre as mensagens 1 e 2.
      string :informacao_3, length: 40, pad_byte: ' '
      string :informacao_4, length: 40, pad_byte: ' '

      string :cnab_g004_1, length: 20, pad_byte: ' '
      lstring :codigo_ocorrencia_pagador, length: 8, pad_byte: '0'

      lstring :banco_codigo_debito, length: 3, pad_byte: '0'

      lstring :agencia_codigo_debito, length: 5, pad_byte: '0'
      string :agencia_dv_debito, length: 1, pad_byte: ' '
      lstring :conta_numero_debito, length: 12, pad_byte: '0'
      string :conta_dv_debito, length: 1, pad_byte: ' '
      string :agencia_conta_dv_debito, length: 1, pad_byte: ' '

      string :aviso_debito_automatico, length: 1, pad_byte: '0'

      string :cnab_g004_2, length: 9, pad_byte: ' '
    end
  end
end