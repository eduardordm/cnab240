require 'spec_helper'

include Cnab240::V87

describe Cnab240::V87::SegmentoZ do

  it "deve instanciar segmento" do
    segmento = Cnab240::V87::SegmentoZ.new
    segmento.should be_an_instance_of(Cnab240::V87::SegmentoZ)
  end

  it "deve conter campos" do
    segmento = Cnab240::V87::SegmentoZ.new

    segmento.should respond_to(:controle_banco)
    segmento.should respond_to(:controle_lote)
    segmento.should respond_to(:controle_registro)

    segmento.should respond_to(:servico_numero_registro)
    segmento.should respond_to(:servico_codigo_segmento)

    segmento.should respond_to(:autenticacao)
    segmento.should respond_to(:controle_bancario)
    segmento.should respond_to(:cnab_g004_1)
    segmento.should respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V87::SegmentoZ.new
    segmento.linha.length.should be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V87::SegmentoZ
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end

end