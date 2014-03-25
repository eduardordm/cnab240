require 'spec_helper'

describe Cnab240::Lote do

  it "deve conter trailer e header" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V87')
    lote.header.should be_an_instance_of(Cnab240::V87::Pagamentos::Header)
    lote.trailer.should be_an_instance_of(Cnab240::V87::Pagamentos::Trailer)
  end

  it "deve conter segmento a" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V87')
    lote << :a
    lote.segmentos[0].should be_an_instance_of(Cnab240::V87::SegmentoA)
  end

  it "deve conter segmento b" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V87')
    lote << :b
    lote.segmentos[0].should be_an_instance_of(Cnab240::V87::SegmentoB)
  end

  it "pode conter segmento c" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V87')
    lote << :c
    lote.segmentos[0].should be_an_instance_of(Cnab240::V87::SegmentoC)
  end

  it "linhas devem ter 240" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V87')
    lote.linhas.each do |linha|
      linha.length.should be(240)
    end
  end
end