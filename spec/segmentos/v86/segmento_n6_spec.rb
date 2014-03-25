require 'spec_helper'

include Cnab240::V86

describe Cnab240::V86::SegmentoN6 do

  it "deve instanciar segmento" do
    segmento = Cnab240::V86::SegmentoN6.new
    segmento.should be_an_instance_of(Cnab240::V86::SegmentoN6)
  end

  it "deve conter campos" do
    segmento = Cnab240::V86::SegmentoN6.new

    segmento.should respond_to(:receita)
    segmento.should respond_to(:tipo_identificacao_contribuinte)
    segmento.should respond_to(:identificacao_contribuinte)
    segmento.should respond_to(:identificacao_tributo)

    segmento.should respond_to(:exercicio)
    segmento.should respond_to(:renavam)
    segmento.should respond_to(:uf)
    segmento.should respond_to(:municipio)
    segmento.should respond_to(:placa)
    segmento.should respond_to(:opcao_pagamento)

    segmento.should respond_to(:cnab)
  end

  it "deve ter 120 caracteres" do
    segmento = Cnab240::V86::SegmentoN6.new
    segmento.linha.length.should be(120)
  end

  it "deve manter coesao" do
    c = Cnab240::V86::SegmentoN6
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end

end