require 'spec_helper'

include Cnab240::V86

RSpec.describe Cnab240::V86::SegmentoJ52 do

  it "deve instanciar segmento" do
    segmento = Cnab240::V86::SegmentoJ52.new
    expect(segmento).to be_an_instance_of(Cnab240::V86::SegmentoJ52)
  end

  it "deve conter campos" do
    segmento = Cnab240::V86::SegmentoJ52.new

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)
    expect(segmento).to respond_to(:servico_tipo_movimento)
    expect(segmento).to respond_to(:servico_codigo_movimento)

    expect(segmento).to respond_to(:cod_registro_opcional)

    expect(segmento).to respond_to(:sacado_tipo_inscricao)
    expect(segmento).to respond_to(:sacado_numero_inscricao)
    expect(segmento).to respond_to(:sacado_nome)

    expect(segmento).to respond_to(:cedente_tipo_inscricao)
    expect(segmento).to respond_to(:cedente_numero_inscricao)
    expect(segmento).to respond_to(:cedente_nome)

    expect(segmento).to respond_to(:sacador_tipo_inscricao)
    expect(segmento).to respond_to(:sacador_numero_inscricao)
    expect(segmento).to respond_to(:sacador_nome)

    expect(segmento).to respond_to(:cnab_g004_1)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V86::SegmentoJ52.new
    expect(segmento.linha.length).to be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V86::SegmentoJ52
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end