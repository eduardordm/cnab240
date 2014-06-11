require 'spec_helper'

include Cnab240::V80

describe Cnab240::V80::SegmentoA do

  it "deve instanciar segmento" do
    segmento = Cnab240::V80::SegmentoA.new
    expect(segmento).to be_an_instance_of(Cnab240::V80::SegmentoA)
  end

  it "deve conter campos" do
    segmento = Cnab240::V80::SegmentoA.new

    expect(segmento).to respond_to(:controle_banco)

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)
    expect(segmento).to respond_to(:servico_tipo_movimento)
    expect(segmento).to respond_to(:zeros_1)

    expect(segmento).to respond_to(:favorecido_banco)
    expect(segmento).to respond_to(:favorecido_agencia_conta)
    expect(segmento).to respond_to(:favorecido_nome)
    expect(segmento).to respond_to(:credito_seu_numero)
    expect(segmento).to respond_to(:credito_data_pagamento)


    expect(segmento).to respond_to(:credito_moeda_tipo)

    expect(segmento).to respond_to(:zeros_2)
    expect(segmento).to respond_to(:credito_valor_pagamento)
    expect(segmento).to respond_to(:credito_nosso_numero)
    expect(segmento).to respond_to(:brancos_1)

    expect(segmento).to respond_to(:credito_data_real)
    expect(segmento).to respond_to(:credito_valor_real)

    expect(segmento).to respond_to(:finalidade_detalhe)
    expect(segmento).to respond_to(:brancos_2)

    expect(segmento).to respond_to(:numero_documento)
    expect(segmento).to respond_to(:numero_inscricao)
    expect(segmento).to respond_to(:codigo_finalidade_complementar)
    expect(segmento).to respond_to(:finalidade_ted)
    expect(segmento).to respond_to(:brancos_3)
    expect(segmento).to respond_to(:aviso)
    expect(segmento).to respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V80::SegmentoA.new
    expect(segmento.linha.length).to be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V80::SegmentoA
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end