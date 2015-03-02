require 'spec_helper'

include Cnab240::V86

RSpec.describe Cnab240::V86::SegmentoN3 do

  it "deve instanciar segmento" do
    segmento = Cnab240::V86::SegmentoN3.new
    expect(segmento).to be_an_instance_of(Cnab240::V86::SegmentoN3)
  end

  it "deve conter campos" do
    segmento = Cnab240::V86::SegmentoN3.new

    expect(segmento).to respond_to(:receita)
    expect(segmento).to respond_to(:tipo_identificacao_contribuinte)
    expect(segmento).to respond_to(:identificacao_contribuinte)
    expect(segmento).to respond_to(:identificacao_tributo)

    expect(segmento).to respond_to(:periodo_apuracao)
    expect(segmento).to respond_to(:receita_bruta)
    expect(segmento).to respond_to(:percentual)
    expect(segmento).to respond_to(:valor_principal)
    expect(segmento).to respond_to(:valor_multa)
    expect(segmento).to respond_to(:valor_juros_encargos)

    expect(segmento).to respond_to(:cnab)
  end

  it "deve ter 120 caracteres" do
    segmento = Cnab240::V86::SegmentoN3.new
    expect(segmento.linha.length).to be(120)
  end

  it "deve manter coesao" do
    c = Cnab240::V86::SegmentoN3
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end

end