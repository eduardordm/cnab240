require 'spec_helper'

include Cnab240::V87

RSpec.describe Cnab240::V87::SegmentoN do

  it "deve instanciar segmento" do
    segmento = Cnab240::V87::SegmentoN.new
    expect(segmento).to be_an_instance_of(Cnab240::V87::SegmentoN)
  end

  it "deve conter campos" do
    segmento = Cnab240::V87::SegmentoN.new

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)
    expect(segmento).to respond_to(:servico_tipo_movimento)
    expect(segmento).to respond_to(:servico_codigo_movimento)

    expect(segmento).to respond_to(:nosso_numero)
    expect(segmento).to respond_to(:contribuinte)
    expect(segmento).to respond_to(:data_pagamento)
    expect(segmento).to respond_to(:valor_pagamento)

    expect(segmento).to respond_to(:n_complemento)

    expect(segmento).to respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V87::SegmentoN.new
    expect(segmento.linha.length).to be(240)
  end

  it "n_complemento deve respeitar choice header (N5)" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa, :versao => 'V87') do |l|
      l.header.servico_forma = '25'
    end
    lote << :n
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V87::SegmentoN)

    segmento = lote.segmentos[0].n_complemento

    expect(segmento).to respond_to(:receita)
    expect(segmento).to respond_to(:tipo_identificacao_contribuinte)
    expect(segmento).to respond_to(:identificacao_contribuinte)
    expect(segmento).to respond_to(:identificacao_tributo)

    expect(segmento).to respond_to(:exercicio)
    expect(segmento).to respond_to(:renavam)
    expect(segmento).to respond_to(:uf)
    expect(segmento).to respond_to(:municipio)
    expect(segmento).to respond_to(:placa)
    expect(segmento).to respond_to(:opcao_pagamento)

    expect(segmento).to respond_to(:cnab)
  end

  it "deve manter coesao" do
    c = Cnab240::V87::SegmentoN
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end

end