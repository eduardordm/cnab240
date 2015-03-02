module Cnab240::V60::Arquivo
  class Trailer < BinData::Record

    include Cnab240::DefaultMixin

    string :controle_banco, :length => 3, :pad_byte => '0'
    string :controle_lote, :length => 4, :initial_value => '9999', :pad_byte => '0'
    string :controle_registro, :length => 1, :initial_value => '9', :pad_byte => '0'

    string :cnab_g004_1, :length => 9, :pad_byte => ' '

    lstring :totais_qtde_lotes, :length => 6, :pad_byte => '0'
    lstring :totais_qtde_registros, :length => 6, :pad_byte => '0'
    lstring :totais_qtde_contas_conciliadas, :length => 6, :pad_byte => '0'

    string :cnab_g004_2, :length => 205, :pad_byte => ' '
  end
end