module Cnab240
  module V81
    class SegmentoQ < BinData::Record
      include Cnab240::DefaultMixin
      include Cnab240::SegmentoMixin

      lstring :controle_banco, length: 3, pad_byte: '0'
      lstring :controle_lote, length: 4, pad_byte: '0'
      string :controle_registro, length: 1, initial_value: '3', pad_byte: '0'

      lstring :servico_numero_registro, length: 5, pad_byte: '0'
      string :servico_codigo_segmento, length: 1, initial_value: 'Q', pad_byte: ' '
      lstring :servico_tipo_movimento, length: 1, pad_byte: ' '
      lstring :servico_codigo_movimento, length: 2, pad_byte: '0'

      lstring :pagador_inscricao_tipo, length: 1, pad_byte: '0' #'1'= CPF, '2'= CGC/CNPJ
      lstring :pagador_inscricao_numero, length: 15, pad_byte: '0'
      string :pagador_nome, length: 40, pad_byte: ' '
      string :pagador_endereco_logradouro, length: 40, pad_byte: ' '
      string :pagador_endereco_bairro, length: 15, pad_byte: ' '
      lstring :pagador_endereco_cep, length: 5, pad_byte: '0'
      string :pagador_endereco_cep_complemento, length: 3, pad_byte: '0'
      string :pagador_endereco_cidade, length: 15, pad_byte: ' '
      string :pagador_endereco_estado, length: 2, pad_byte: ' '

      lstring :avalista_inscricao_tipo, length: 1, pad_byte: '0' #'1'= CPF, '2'= CGC/CNPJ
      lstring :avalista_inscricao_numero, length: 15, pad_byte: '0'
      string :avalista_nome, length: 40, pad_byte: ' '

      string :banco_correspondente, length: 3, pad_byte: '0'
      string :banco_correspondente_nosso_numero, length: 20, pad_byte: ' '

      string :cnab_g004_1, length: 8, pad_byte: ' '
    end
  end
end