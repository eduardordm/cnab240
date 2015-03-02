require 'spec_helper'

RSpec.describe Cnab240::V86::Arquivo::Header do

  it "deve ter campos de header" do
    header = Cnab240::V86::Arquivo::Header.new

    expect(header).to respond_to(:controle_banco)
    expect(header).to respond_to(:controle_lote)
    expect(header).to respond_to(:controle_registro)

    expect(header).to respond_to(:cnab_g004_1)

    expect(header).to respond_to(:empresa_tipo)
    expect(header).to respond_to(:empresa_numero)
    expect(header).to respond_to(:empresa_convenio)
    expect(header).to respond_to(:empresa_agencia_codigo)
    expect(header).to respond_to(:empresa_agencia_dv)
    expect(header).to respond_to(:empresa_conta_numero)
    expect(header).to respond_to(:empresa_conta_dv)
    expect(header).to respond_to(:empresa_agencia_conta_dv)
    expect(header).to respond_to(:empresa_nome)

    expect(header).to respond_to(:banco_nome)

    expect(header).to respond_to(:cnab_g004_2)

    expect(header).to respond_to(:arquivo_codigo)
    expect(header).to respond_to(:arquivo_data_geracao)
    expect(header).to respond_to(:arquivo_hora_geracao)
    expect(header).to respond_to(:arquivo_sequencia)
    expect(header).to respond_to(:arquivo_layout)
    expect(header).to respond_to(:arquivo_densidade)

    expect(header).to respond_to(:reservado_banco)
    expect(header).to respond_to(:reservado_empresa)

    expect(header).to respond_to(:cnab_g004_3)
  end

  it "header deve ter 240 caracteres" do
    header = Cnab240::V86::Arquivo::Header.new
    expect(header.linha.length).to be(240)
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

    expect(linha1).to eq linha2
  end
end