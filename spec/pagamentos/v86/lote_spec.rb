require 'spec_helper'

RSpec.describe Cnab240::Lote do

  it "deve conter trailer e header" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    expect(lote.header).to be_an_instance_of(Cnab240::V86::Pagamentos::Header)
    expect(lote.trailer).to be_an_instance_of(Cnab240::V86::Pagamentos::Trailer)
  end

  it "deve conter segmento a" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    lote << :a
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoA)
  end

  it "deve conter segmento b" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    lote << :b
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoB)
  end

  it "pode conter segmento c" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    lote << :c
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoC)
  end

  it "linhas devem ter 240" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    lote << :a
    lote.linhas.each do |linha|
      expect(linha.length).to be(240)
    end
  end
end