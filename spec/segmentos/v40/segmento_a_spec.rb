require 'spec_helper'

include Cnab240::V40

describe Cnab240::V40::SegmentoA do

  it "deve instanciar segmento" do
    segmento = Cnab240::V40::SegmentoA.new
    expect(segmento).to be_an_instance_of(Cnab240::V40::SegmentoA)
  end

  it "deve conter campos" do
    segmento = Cnab240::V40::SegmentoA.new

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)
    expect(segmento).to respond_to(:servico_codigo_movimento)

    expect(segmento).to respond_to(:favorecido_camara)
    expect(segmento).to respond_to(:favorecido_banco)
    expect(segmento).to respond_to(:brancos_1)

    expect(segmento).to respond_to(:favorecido_agencia_codigo)
    expect(segmento).to respond_to(:brancos_2)
    expect(segmento).to respond_to(:brancos_3)

    expect(segmento).to respond_to(:favorecido_conta_numero)
    expect(segmento).to respond_to(:brancos_4)
    expect(segmento).to respond_to(:favorecido_agencia_conta_dv)
    expect(segmento).to respond_to(:favorecido_nome)

    expect(segmento).to respond_to(:credito_seu_numero)
    expect(segmento).to respond_to(:brancos_5)
    expect(segmento).to respond_to(:credito_data_pagamento)
    expect(segmento).to respond_to(:credito_moeda_tipo)
    expect(segmento).to respond_to(:credito_moeda_quantidade)
    expect(segmento).to respond_to(:credito_valor_pagamento)
    expect(segmento).to respond_to(:credito_nosso_numero)
    expect(segmento).to respond_to(:credito_data_real)
    expect(segmento).to respond_to(:credito_valor_real)

    expect(segmento).to respond_to(:tipo_mora)
    expect(segmento).to respond_to(:valor_mora)

    expect(segmento).to respond_to(:complemento)
    expect(segmento).to respond_to(:brancos_6)
    expect(segmento).to respond_to(:numero_inscricao)

    expect(segmento).to respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V40::SegmentoA.new
    expect(segmento.linha.length).to be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V40::SegmentoA
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end

end