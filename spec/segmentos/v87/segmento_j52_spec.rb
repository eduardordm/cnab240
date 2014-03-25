require 'spec_helper'

include Cnab240::V87

describe Cnab240::V87::SegmentoJ52 do

  it "deve instanciar segmento" do
    segmento = Cnab240::V87::SegmentoJ52.new
    segmento.should be_an_instance_of(SegmentoJ52)
  end

  it "deve conter campos" do
    segmento = Cnab240::V87::SegmentoJ52.new

    segmento.should respond_to(:controle_banco)
    segmento.should respond_to(:controle_lote)
    segmento.should respond_to(:controle_registro)

    segmento.should respond_to(:servico_numero_registro)
    segmento.should respond_to(:servico_codigo_segmento)
    segmento.should respond_to(:servico_tipo_movimento)
    segmento.should respond_to(:servico_codigo_movimento)

    segmento.should respond_to(:cod_registro_opcional)

    segmento.should respond_to(:sacado_tipo_inscricao)
    segmento.should respond_to(:sacado_numero_inscricao)
    segmento.should respond_to(:sacado_nome)

    segmento.should respond_to(:cedente_tipo_inscricao)
    segmento.should respond_to(:cedente_numero_inscricao)
    segmento.should respond_to(:cedente_nome)

    segmento.should respond_to(:sacador_tipo_inscricao)
    segmento.should respond_to(:sacador_numero_inscricao)
    segmento.should respond_to(:sacador_nome)

    segmento.should respond_to(:cnab_g004_1)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V87::SegmentoJ52.new
    segmento.linha.length.should be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V87::SegmentoJ52
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    linha1.should eq linha2
  end
end