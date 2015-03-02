require 'spec_helper'

describe Cnab240::Lote do

  it "deve conter trailer e header" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
    expect(lote.header).to be_an_instance_of(Cnab240::V86::PagamentosTributos::Header)
    expect(lote.trailer).to be_an_instance_of(Cnab240::V86::PagamentosTributos::Trailer)
  end

  it "deve conter segmento o" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
    lote << :o
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoO)
  end

  it "deve conter segmento n" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
    lote << :n
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoN)
  end

  it "pode conter segmento w" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
    lote << :w
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoW)
  end

  it "pode conter segmento z" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
    lote << :z
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V86::SegmentoZ)
  end

  it "linhas devem ter 240" do
    lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
    lote.linhas.each do |linha|
      expect(linha.length).to be(240)
    end
  end
end