require 'spec_helper'

include Cnab240::V86

describe SegmentoO do

  it "deve instanciar segmento" do
    segmento = SegmentoO.new
    segmento.should be_an_instance_of(SegmentoO)
  end

  it "deve conter campos" do
    segmento = SegmentoO.new

    segmento.should respond_to(:controle_banco)
    segmento.should respond_to(:controle_lote)
    segmento.should respond_to(:controle_registro)

    segmento.should respond_to(:servico_numero_registro)
    segmento.should respond_to(:servico_codigo_segmento)
    segmento.should respond_to(:servico_tipo_movimento)
    segmento.should respond_to(:servico_codigo_movimento)

    segmento.should respond_to(:codigo_barras)
    segmento.should respond_to(:nome_concessionaria)
    segmento.should respond_to(:data_vencimento)
    segmento.should respond_to(:data_pagamento)
    segmento.should respond_to(:valor_pagamento)
    segmento.should respond_to(:seu_numero)
    segmento.should respond_to(:nosso_numero)

    segmento.should respond_to(:cnab_g004_1)
    segmento.should respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = SegmentoO.new
    segmento.linha.length.should be(240)
  end

  it "deve manter coesao" do
    c = SegmentoO
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end

end