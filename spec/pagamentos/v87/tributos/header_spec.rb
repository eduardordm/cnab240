require 'spec_helper'

describe Cnab240::V87::PagamentosTributos::Header do

  it "deve conter campos header" do
    header = Cnab240::V87::PagamentosTributos::Header.new

    expect(header).to respond_to(:controle_banco)
    expect(header).to respond_to(:controle_lote)
    expect(header).to respond_to(:controle_registro)

    expect(header).to respond_to(:servico_operacao)
    expect(header).to respond_to(:servico_tipo)
    expect(header).to respond_to(:servico_forma)
    expect(header).to respond_to(:servico_layout)

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

    expect(header).to respond_to(:informacao_1)

    expect(header).to respond_to(:endereco_logradouro)
    expect(header).to respond_to(:endereco_numero)
    expect(header).to respond_to(:endereco_complemento)
    expect(header).to respond_to(:endereco_cidade)
    expect(header).to respond_to(:endereco_cep)
    expect(header).to respond_to(:endereco_complemento_cep)
    expect(header).to respond_to(:endereco_estado)

    expect(header).to respond_to(:indicativo_forma_pagamento)

    expect(header).to respond_to(:cnab_g004_2)

    expect(header).to respond_to(:ocorrencias)
  end

  it "header deve ter 240 caracteres" do
    header = Cnab240::V87::PagamentosTributos::Header.new
    expect(header.linha.length).to be(240)
  end
end