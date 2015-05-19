module Cnab240
  module V81
    class SegmentoP < BinData::Record
      include Cnab240::DefaultMixin
      include Cnab240::SegmentoMixin

      lstring :controle_banco, length: 3, pad_byte: '0'
      lstring :controle_lote, length: 4, pad_byte: '0'
      string :controle_registro, length: 1, initial_value: '3', pad_byte: '0'

      lstring :servico_numero_registro, length: 5, pad_byte: '0'
      string :servico_codigo_segmento, length: 1, initial_value: 'P', pad_byte: ' '
      lstring :servico_tipo_movimento, length: 1, pad_byte: ' '
      lstring :servico_codigo_movimento, length: 2, pad_byte: '0'

      lstring :beneficiario_agencia_codigo, length: 5, pad_byte: '0'
      string :beneficiario_agencia_dv, length: 1, pad_byte: ' '
      lstring :beneficiario_conta_numero, length: 12, pad_byte: '0'
      string :beneficiario_conta_dv, length: 1, pad_byte: ' '
      string :beneficiario_agencia_conta_dv, length: 1, pad_byte: ' '

      # Nosso Número:
      # - Se emissão a cargo do Sicoob: Brancos
      # - Se emissão a cargo do Cedente:
      #   NumTitulo - 10 posições (1 a 10)
      #   Parcela - 02 posições (11 a 12) - "01" se parcela única
      #   Modalidade - 02 posições (13 a 14) - vide planilha "Capa" deste arquivo
      #   Tipo Formulário - 01 posição  (15 a 15):
      #      "1" -auto-copiativo
      #      "3" -auto-envelopável
      #      "4" -A4 sem envelopamento
      #      "6" -A4 sem envelopamento 3 vias
      #   Em branco - 05 posições (16 a 20)
      string :nosso_numero, length: 20, pad_byte: ' '
      string :codigo_carteira, length: 1, pad_byte: '0'
      string :forma_cadastro, length: 1, initial_value: '0', pad_byte: '0'
      string :tipo_documento, length: 1, pad_byte: ' '
      string :emissao_boleto, length: 1, initial_value: '2', pad_byte: '0' #'1'= Sicoob Emite, '2' = Cedente Emite
      string :distribuicao_boleto, length: 1, initial_value: '2', pad_byte: '0' #'1' = Sicoob Distribui, '2' = Cedente Distribui
      string :numero_documento, length: 15, pad_byte: ' '
      lstring :data_vencimento, length: 8, pad_byte: '0'
      lstring :valor, length: 15, pad_byte: '0'
      lstring :agencia_cobradora, length: 5, pad_byte: '0'
      string :agencia_cobradora_dv, length: 1, pad_byte: ' '
      lstring :especie_titulo, length: 2, pad_byte: '0'
      string :aceite, length: 1, initial_value: 'N', pad_byte: '0' #'A' = Aceite, 'N' = Não Aceite
      lstring :data_emissao, length: 8, pad_byte: '0'

      lstring :juros_mora, length: 1, pad_byte: '0' #'1'= Valor por Dia, '2' = Taxa Mensal, '3' = Isento
      lstring :data_juros_mora, length: 8, pad_byte: '0'
      lstring :valor_juros_mora, length: 15, pad_byte: '0'

      lstring :codigo_desconto_1, length: 1, pad_byte: '0' #'1'= Valor Fixo Até a Data Informada, '2'= Percentual Até a Data Informada
      lstring :data_desconto_1, length: 8, pad_byte: '0'
      lstring :valor_desconto_1, length: 15, pad_byte: '0'

      lstring :valor_iof, length: 15, pad_byte: '0'
      lstring :valor_abatimento, length: 15, pad_byte: '0'

      lstring :identificacao_beneficiario, length: 25, pad_byte: ' '

      lstring :codigo_protesto, length: 1, initial_value: '1', pad_byte: '0'
      lstring :dias_protesto, length: 2, pad_byte: ' '
      lstring :codigo_baixa, length: 1, initial_value: '0', pad_byte: '0'
      lstring :dias_baixa, length: 2, pad_byte: ' '

      lstring :moeda, length: 2, initial_value: '09', pad_byte: '0' #'02' = Dólar, '09' = Real
      lstring :contrato_operacao_credito, length: 10, pad_byte: '0'
      string :cnab_g004_1, length: 1, pad_byte: ' '
    end
  end
end