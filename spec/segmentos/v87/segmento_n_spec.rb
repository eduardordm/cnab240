require 'spec_helper'

include Cnab240::V87

describe Cnab240::V87::SegmentoN do

  it "deve instanciar segmento" do
    segmento = Cnab240::V87::SegmentoN.new
    segmento.should be_an_instance_of(Cnab240::V87::SegmentoN)
  end

  it "deve conter campos" do
    segmento = Cnab240::V87::SegmentoN.new

    segmento.should respond_to(:controle_banco)
    segmento.should respond_to(:controle_lote)
    segmento.should respond_to(:controle_registro)

    segmento.should respond_to(:servico_numero_registro)
    segmento.should respond_to(:servico_codigo_segmento)
    segmento.should respond_to(:servico_tipo_movimento)
    segmento.should respond_to(:servico_codigo_movimento)

    segmento.should respond_to(:nosso_numero)
    segmento.should respond_to(:contribuinte)
    segmento.should respond_to(:data_pagamento)
    segmento.should respond_to(:valor_pagamento)

    segmento.should respond_to(:n_complemento)

    segmento.should respond_to(:ocorrencias)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V87::SegmentoN.new
    segmento.linha.length.should be(240)
  end

  it "n_complemento deve respeitar choice header (N5)" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa, :versao => 'V87') do |l|
      l.header.servico_forma = '25'
    end
    lote << :n
    lote.segmentos[0].should be_an_instance_of(Cnab240::V87::SegmentoN)

    segmento = lote.segmentos[0].n_complemento

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

  it "deve manter coesao" do
    c = Cnab240::V87::SegmentoN
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end

end