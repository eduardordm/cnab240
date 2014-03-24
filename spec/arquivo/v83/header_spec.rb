require 'spec_helper'

describe Cnab240::V83::Arquivo::Header do

  it "deve ter campos de header" do
    header = Cnab240::V83::Arquivo::Header.new


    lstring :controle_banco, :length => 3, :pad_byte => '0'
    lstring :controle_lote, :length => 4, :initial_value => '0000', :pad_byte => '0'
    lstring :controle_registro, :length => 1, :initial_value => '0', :pad_byte => '0'

    string :cnab_g004_1, :length => 9, :initial_value => ' ', :pad_byte => ' '

    lstring :empresa_tipo, :length => 1, :pad_byte => '0'
    lstring :empresa_numero, :length => 14, :pad_byte => '0'
    string :empresa_convenio, :length => 20, :pad_byte => ' '
    lstring :empresa_agencia_codigo, :length => 5, :pad_byte => '0'
    string :empresa_agencia_dv, :length => 1, :pad_byte => ' '
    lstring :empresa_conta_numero, :length => 12, :pad_byte => '0'
    string :empresa_conta_dv, :length => 1, :pad_byte => ' '
    string :empresa_agencia_conta_dv, :length => 1, :pad_byte => ' '
    string :empresa_nome, :length => 30, :pad_byte => ' '

    string :banco_nome, :length => 30, :pad_byte => ' '

    string :cnab_g004_2, :length => 10, :pad_byte => ' '

    lstring :arquivo_codigo, :length => 1, :pad_byte => '0'
    lstring :arquivo_data_geracao, :length => 8, :pad_byte => '0'
    lstring :arquivo_hora_geracao, :length => 6, :pad_byte => '0'
    lstring :arquivo_sequencia, :length => 6, :pad_byte => '0'
    string :arquivo_layout, :length => 3, :initial_value => '060'
    lstring :arquivo_densidade, :length => 5, :pad_byte => '0'

    string :reservado_banco, :length => 20, :pad_byte => ' '
    string :reservado_empresa, :length => 20, :pad_byte => ' '

    string :cnab_g004_3, :length => 29, :pad_byte => ' '


    header.should respond_to(:controle_banco)
    header.should respond_to(:controle_lote)
    header.should respond_to(:controle_registro)

    header.should respond_to(:brancos_1)
    header.should respond_to(:arquivo_layout)

    header.should respond_to(:empresa_tipo)
    header.should respond_to(:empresa_numero)

    header.should respond_to(:brancos_2)

    header.should respond_to(:empresa_agencia_codigo)
    header.should respond_to(:brancos_3)
    header.should respond_to(:empresa_conta_numero)
    header.should respond_to(:brancos_4)
    header.should respond_to(:empresa_agencia_conta_dv)
    header.should respond_to(:empresa_nome)
    header.should respond_to(:banco_nome)
    header.should respond_to(:brancos_5)

    header.should respond_to(:arquivo_codigo)
    header.should respond_to(:arquivo_data_geracao)
    header.should respond_to(:arquivo_hora_geracao)

    #header.should respond_to(:brancos_6)
    header.should respond_to(:zeros_6)

    header.should respond_to(:arquivo_densidade)

    header.should respond_to(:brancos_7)
  end

  it "header deve ter 240 caracteres" do
    header = Cnab240::V83::Arquivo::Header.new
    header.linha.length.should be(240)
  end

  it "conversao deve manter consistencia" do
    header = Cnab240::V83::Arquivo::Header.new

    header.controle_banco= "8"
    header.controle_lote= "8"
    header.controle_registro= "8"


    linha1 = header.linha

    header2 = Cnab240::V83::Arquivo::Header.read(linha1)
    linha2 = header2.linha

    linha1.should eq linha2
  end
end