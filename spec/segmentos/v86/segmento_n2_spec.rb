require 'spec_helper'

include Cnab240::V86

describe Cnab240::V86::SegmentoN2 do

  it "deve instanciar segmento" do
    segmento = Cnab240::V86::SegmentoN2.new
    segmento.should be_an_instance_of(Cnab240::V86::SegmentoN2)
  end

  it "deve conter campos" do
    segmento = Cnab240::V86::SegmentoN2.new

    segmento.should respond_to(:receita)
    segmento.should respond_to(:tipo_identificacao_contribuinte)
    segmento.should respond_to(:identificacao_contribuinte)
    segmento.should respond_to(:identificacao_tributo)

    segmento.should respond_to(:periodo_apuracao)
    segmento.should respond_to(:numero_referencia)
    segmento.should respond_to(:valor_principal)
    segmento.should respond_to(:valor_multa)
    segmento.should respond_to(:valor_juros_encargos)
    segmento.should respond_to(:data_vencimento)

    segmento.should respond_to(:cnab)
  end

  it "deve ter 120 caracteres" do
    segmento = Cnab240::V86::SegmentoN2.new
    segmento.linha.length.should be(120)
  end

  it "deve manter coesao" do
    c = Cnab240::V86::SegmentoN2
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end
end