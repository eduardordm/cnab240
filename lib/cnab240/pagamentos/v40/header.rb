module Cnab240::V40::Pagamentos
  class Header < BinData::Record

    include Cnab240::DefaultMixin

    lstring :controle_banco, :length => 3, :pad_byte => '0'
    lstring :controle_lote, :length => 4, :pad_byte => '0'
    lstring :controle_registro, :length => 1, :initial_value => '1', :pad_byte => '0'

    string :servico_operacao, :length => 1, :initial_value => 'D', :pad_byte => ' '
    lstring :servico_tipo, :length => 2, :pad_byte => '0'
    lstring :servico_forma, :length => 2, :pad_byte => '0'
    lstring :servico_layout, :length => 3, :initial_value => '030', :pad_byte => '0'
    string :cnab_g004_1, :length => 1, :pad_byte => ' '

    lstring :empresa_tipo, :length => 1, :pad_byte => '0'
    lstring :empresa_numero, :length => 14, :pad_byte => '0'
    string :empresa_convenio, :length => 13, :pad_byte => ' '

    string :brancos_1, :length => 7, :pad_byte => ' '
    lstring :brancos_2, :length => 1, :pad_byte => '0'

    lstring :empresa_agencia_codigo, :length => 4, :pad_byte => '0'

    string :brancos_3, :length => 1, :pad_byte => ' '
    lstring :brancos_4, :length => 7, :pad_byte => '0'

    lstring :empresa_conta_numero, :length => 5, :pad_byte => '0'

    string :brancos_5, :length => 1, :pad_byte => ' '

    string :empresa_agencia_conta_dv, :length => 1, :pad_byte => '0'
    string :empresa_nome, :length => 30, :pad_byte => ' '

    string :informacao_1, :length => 40, :pad_byte => ' '

    string :endereco_logradouro, :length => 30, :pad_byte => ' '
    lstring :endereco_numero, :length => 5, :pad_byte => '0'
    string :endereco_complemento, :length => 15, :pad_byte => ' '
    string :endereco_cidade, :length => 20, :pad_byte => ' '
    lstring :endereco_cep, :length => 8, :pad_byte => '0'
    string :endereco_estado, :length => 2, :pad_byte => ' '

    string :cnab_g004_2, :length => 8, :pad_byte => ' '
    string :ocorrencias, :length => 10, :pad_byte => ' '

    protected

    def auto_fill

    end
  end
end