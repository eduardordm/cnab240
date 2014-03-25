require 'spec_helper'

include Cnab240::V86

describe Cnab240::V86::SegmentoN4 do

  it "deve instanciar segmento" do
    segmento = Cnab240::V86::SegmentoN4.new
    segmento.should be_an_instance_of(Cnab240::V86::SegmentoN4)
  end

  it "deve conter campos" do
    segmento = Cnab240::V86::SegmentoN4.new

    segmento.should respond_to(:receita)
    segmento.should respond_to(:tipo_identificacao_contribuinte)
    segmento.should respond_to(:identificacao_contribuinte)
    segmento.should respond_to(:identificacao_tributo)

    segmento.should respond_to(:vencimento)
    segmento.should respond_to(:ie_munic_declar)
    segmento.should respond_to(:divida_ativa_etiqueta)
    segmento.should respond_to(:periodo_referencia)
    segmento.should respond_to(:numero_parcela_notificacao)
    segmento.should respond_to(:valor_receita)
    segmento.should respond_to(:valor_juros_encargos)
    segmento.should respond_to(:valor_multa)

    segmento.should respond_to(:cnab)
  end

  it "deve ter 120 caracteres" do
    segmento = Cnab240::V86::SegmentoN4.new
    segmento.linha.length.should be(120)
  end

  it "deve manter coesao" do
    c = Cnab240::V86::SegmentoN4
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end

end