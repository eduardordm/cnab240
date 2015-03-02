require 'spec_helper'

RSpec.describe Cnab240::Lote do
  it 'deve conter trailer e header' do
    lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: 'V87')
    expect(lote.header).to be_an_instance_of(Cnab240::V87::Pagamentos::Header)
    expect(lote.trailer).to be_an_instance_of(Cnab240::V87::Pagamentos::Trailer)
  end

  it 'deve conter segmento a' do
    lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: 'V87')
    lote << :a
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V87::SegmentoA)
  end

  it 'deve conter segmento b' do
    lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: 'V87')
    lote << :b
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V87::SegmentoB)
  end

  it 'pode conter segmento c' do
    lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: 'V87')
    lote << :c
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V87::SegmentoC)
  end

  it 'linhas devem ter 240' do
    lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: 'V87')
    lote << :a
    lote.linhas.each do |linha|
      expect(linha.length).to be(240)
    end
  end
end
