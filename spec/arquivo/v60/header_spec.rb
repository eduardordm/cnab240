require 'spec_helper'

RSpec.describe Cnab240::V60::Arquivo::Header do
  it 'deve ter campos de header' do
    header = Cnab240::V60::Arquivo::Header.new

    expect(header).to respond_to(:controle_banco)
    expect(header).to respond_to(:controle_lote)
    expect(header).to respond_to(:controle_registro)

    expect(header).to respond_to(:cnab_g004_1)
    expect(header).to respond_to(:arquivo_layout)

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
    expect(header).to respond_to(:banco_nome)

    expect(header).to respond_to(:cnab_g004_2)

    expect(header).to respond_to(:arquivo_codigo)
    expect(header).to respond_to(:arquivo_data_geracao)
    expect(header).to respond_to(:arquivo_hora_geracao)
    expect(header).to respond_to(:arquivo_sequencia)
    expect(header).to respond_to(:arquivo_densidade)

    expect(header).to respond_to(:reservado_banco)
    expect(header).to respond_to(:reservado_empresa)

    expect(header).to respond_to(:cnab_g004_3)
  end

  it 'header deve ter 240 caracteres' do
    header = Cnab240::V60::Arquivo::Header.new
    expect(header.linha.length).to be(240)
    expect(header.arquivo_layout).to eq('060')
  end

  it 'conversao deve manter consistencia' do
    header = Cnab240::V60::Arquivo::Header.new

    header.controle_banco = '8'
    header.controle_lote = '8'
    header.controle_registro = '8'

    linha1 = header.linha

    header2 = Cnab240::V60::Arquivo::Header.read(linha1)
    linha2 = header2.linha

    expect(linha1).to eq linha2
  end
end
