require 'spec_helper'

include Cnab240::V87

RSpec.describe Cnab240::V87::SegmentoN8 do
  it 'deve instanciar segmento' do
    segmento = Cnab240::V87::SegmentoN8.new
    expect(segmento).to be_an_instance_of(Cnab240::V87::SegmentoN8)
  end

  it 'deve conter campos' do
    segmento = Cnab240::V87::SegmentoN8.new

    expect(segmento).to respond_to(:receita)
    expect(segmento).to respond_to(:tipo_identificacao_contribuinte)
    expect(segmento).to respond_to(:identificacao_contribuinte)

    expect(segmento).to respond_to(:ie_munic_declar)

    expect(segmento).to respond_to(:origem)
    expect(segmento).to respond_to(:valor_principal)
    expect(segmento).to respond_to(:atualizacao_monetaria)
    expect(segmento).to respond_to(:valor_mora)
    expect(segmento).to respond_to(:valor_multa)
    expect(segmento).to respond_to(:data_vencimento)
    expect(segmento).to respond_to(:periodo_parcela)
  end

  it 'deve ter 120 caracteres' do
    segmento = Cnab240::V87::SegmentoN8.new
    expect(segmento.linha.length).to be(120)
  end

  it 'deve manter coesao' do
    c = Cnab240::V87::SegmentoN8
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end
