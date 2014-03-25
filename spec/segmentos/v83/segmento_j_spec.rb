require 'spec_helper'

include Cnab240::V83

describe Cnab240::V83::SegmentoJ do

  it "deve instanciar segmento" do
    segmento = Cnab240::V83::SegmentoJ.new
    segmento.should be_an_instance_of(Cnab240::V83::SegmentoJ)
  end

  it "deve conter campos" do
    segmento = Cnab240::V83::SegmentoJ.new

    segmento.should respond_to(:controle_banco)
    segmento.should respond_to(:controle_lote)
    segmento.should respond_to(:controle_registro)

    segmento.should respond_to(:servico_numero_registro)
    segmento.should respond_to(:servico_codigo_segmento)
    segmento.should respond_to(:servico_tipo_movimento)
    segmento.should respond_to(:servico_codigo_movimento)

    segmento.should respond_to(:codigo_barras)
    segmento.should respond_to(:nome_cedente)
    segmento.should respond_to(:data_vencimento)
    segmento.should respond_to(:valor_titulo)
    segmento.should respond_to(:valor_desconto_abatimento)
    segmento.should respond_to(:valor_mora_juros)
    segmento.should respond_to(:data_pagamento)
    segmento.should respond_to(:quantidade_moeda)
    segmento.should respond_to(:referencia_sacado)

    segmento.should respond_to(:nosso_numero)
    segmento.should respond_to(:codigo_moeda)

    segmento.should respond_to(:cnab_g004_1)
    segmento.should respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V83::SegmentoJ.new
    segmento.linha.length.should be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V83::SegmentoJ
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end

end