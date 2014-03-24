require 'spec_helper'

describe Cnab240::V86::Arquivo::Header do

  it "deve ter campos de header" do
    header = Cnab240::V86::Arquivo::Header.new

    header.should respond_to(:controle_banco)
    header.should respond_to(:controle_lote)
    header.should respond_to(:controle_registro)

    header.should respond_to(:cnab_g004_1)

    header.should respond_to(:empresa_tipo)
    header.should respond_to(:empresa_numero)
    header.should respond_to(:empresa_convenio)
    header.should respond_to(:empresa_agencia_codigo)
    header.should respond_to(:empresa_agencia_dv)
    header.should respond_to(:empresa_conta_numero)
    header.should respond_to(:empresa_conta_dv)
    header.should respond_to(:empresa_agencia_conta_dv)
    header.should respond_to(:empresa_nome)

    header.should respond_to(:banco_nome)

    header.should respond_to(:cnab_g004_2)

    header.should respond_to(:arquivo_codigo)
    header.should respond_to(:arquivo_data_geracao)
    header.should respond_to(:arquivo_hora_geracao)
    header.should respond_to(:arquivo_sequencia)
    header.should respond_to(:arquivo_layout)
    header.should respond_to(:arquivo_densidade)

    header.should respond_to(:reservado_banco)
    header.should respond_to(:reservado_empresa)

    header.should respond_to(:cnab_g004_3)
  end

  it "header deve ter 240 caracteres" do
    header = Cnab240::V86::Arquivo::Header.new
    header.linha.length.should be(240)
  end

  it "conversao deve manter consistencia" do
    header = Cnab240::V86::Arquivo::Header.new

    header.controle_banco= "8"
    header.controle_lote= "8"
    header.controle_registro= "8"

    header.cnab_g004_1= "8"

    header.empresa_tipo= "8"
    header.empresa_numero= "8"
    header.empresa_convenio= "8"
    header.empresa_agencia_codigo= "8"
    header.empresa_agencia_dv= "8"
    header.empresa_conta_numero= "8"
    header.empresa_conta_dv= "8"
    header.empresa_agencia_conta_dv= "8"
    header.empresa_nome= "8"

    header.banco_nome= "8"

    header.cnab_g004_2= "8"

    header.arquivo_codigo= "8"
    header.arquivo_data_geracao= "8"
    header.arquivo_hora_geracao= "8"
    header.arquivo_sequencia= "8"
    header.arquivo_layout= "085"
    header.arquivo_densidade= "8"

    header.reservado_banco= "8"
    header.reservado_empresa= "8"

    header.cnab_g004_3= "8"

    linha1 = header.linha

    header2 = Cnab240::V86::Arquivo::Header.read(linha1)
    linha2 = header2.linha

    linha1.should eq linha2
  end
end