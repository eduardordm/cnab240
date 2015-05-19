module Cnab240
  module V81
    class SegmentoS < BinData::Record
      include Cnab240::DefaultMixin
      include Cnab240::SegmentoMixin

      lstring :controle_banco, length: 3, pad_byte: '0'
      lstring :controle_lote, length: 4, pad_byte: '0'
      string :controle_registro, length: 1, initial_value: '3', pad_byte: '0'
      lstring :servico_numero_registro, length: 5, pad_byte: '0'
      string :servico_codigo_segmento, length: 1, initial_value: 'S', pad_byte: ' '
      lstring :servico_tipo_movimento, length: 1, pad_byte: ' '
      lstring :servico_codigo_movimento, length: 2, pad_byte: '0'

      # '1' = Frente do Bloqueto, '2' = Verso do Bloqueto, '3' = Corpo de Instruções da Ficha de Compensação do Boleto
      lstring :tipo_impressao, length: 1, pad_byte: '0'

      # Tipo 1 ou 2
      # lstring :numero_linha, length: 2, pad_byte: '0'
      # string :mensagem, length: 40, pad_byte: ' '
      # lstring :tipo_caracter, length: 2, pad_byte: '0'
      # string :cnab_g004_1, length: 78, pad_byte: ' '

      # Tipo 3
      # Texto de observações destinado ao envio de mensagens livres,
      # a serem impressas no campo de instruções da ficha de compensação do bloqueto.
      # As mensagens 5 à 9 prevalecem sobre as anteriores
      string :informacao_5, length: 40, pad_byte: ' '
      string :informacao_6, length: 40, pad_byte: ' '
      string :informacao_7, length: 40, pad_byte: ' '
      string :informacao_8, length: 40, pad_byte: ' '
      string :informacao_9, length: 40, pad_byte: ' '
      string :cnab_g004_1, length: 22, pad_byte: ' '
    end
  end
end