require 'spec_helper'

RSpec.describe Cnab240::V80::Arquivo::Header do

  it "deve ter campos de header" do
    header = Cnab240::V80::Arquivo::Header.new

    expect(header).to respond_to(:controle_banco)
    expect(header).to respond_to(:controle_lote)
    expect(header).to respond_to(:controle_registro)

    expect(header).to respond_to(:brancos_1)
    expect(header).to respond_to(:arquivo_layout)

    expect(header).to respond_to(:empresa_tipo)
    expect(header).to respond_to(:empresa_numero)

    expect(header).to respond_to(:brancos_2)

    expect(header).to respond_to(:empresa_agencia_codigo)
    expect(header).to respond_to(:brancos_3)
    expect(header).to respond_to(:empresa_conta_numero)
    expect(header).to respond_to(:brancos_4)
    expect(header).to respond_to(:empresa_agencia_conta_dv)
    expect(header).to respond_to(:empresa_nome)
    expect(header).to respond_to(:banco_nome)
    expect(header).to respond_to(:brancos_5)

    expect(header).to respond_to(:arquivo_codigo)
    expect(header).to respond_to(:arquivo_data_geracao)
    expect(header).to respond_to(:arquivo_hora_geracao)

    #header.should respond_to(:brancos_6)
    expect(header).to respond_to(:zeros_6)

    expect(header).to respond_to(:arquivo_densidade)

    expect(header).to respond_to(:brancos_7)
  end

  it "header deve ter 240 caracteres" do
    header = Cnab240::V80::Arquivo::Header.new
    expect(header.linha.length).to be(240)
  end

  it "conversao deve manter consistencia" do
    header = Cnab240::V80::Arquivo::Header.new

    header.controle_banco= "8"
    header.controle_lote= "8"
    header.controle_registro= "8"


    linha1 = header.linha

    header2 = Cnab240::V80::Arquivo::Header.read(linha1)
    linha2 = header2.linha

    expect(linha1).to eq linha2
  end
end