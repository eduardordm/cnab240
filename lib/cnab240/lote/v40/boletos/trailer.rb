module Cnab240
  class Lote
    module V40
      module Boletos
        class Trailer < BinData::Record
          include Cnab240::DefaultMixin

          lstring :controle_banco, length: 3, pad_byte: '0'
          lstring :controle_lote, length: 4, pad_byte: '0'
          lstring :controle_registro, length: 1, initial_value: '5', pad_byte: '0'

          lstring :cnab_g004_1, length: 9, pad_byte: '0'
          lstring :totais_qtde_registros, length: 6, pad_byte: '0'
          lstring :qtde_cobranca_simples, length: 6, pad_byte: '0'
          lstring :total_cobranca_simples, length: 17, pad_byte: '0'
          lstring :qtde_cobranca_vinculada, length: 6, pad_byte: '0'
          lstring :total_cobranca_vinculada, length: 17, pad_byte: '0'
          lstring :qtde_cobranca_caucionada, length: 6, pad_byte: '0'
          lstring :total_cobranca_caucionada, length: 17, pad_byte: '0'
          lstring :qtde_cobranca_descontada, length: 6, pad_byte: '0'
          lstring :total_cobranca_descontada, length: 17, pad_byte: '0'

          string :aviso, length: 8, pad_byte: ' '
          string :cnab_g004_2, length: 117, pad_byte: ' '
        end
      end
    end
  end
end