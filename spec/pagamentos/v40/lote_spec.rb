require 'spec_helper'

RSpec.describe Cnab240::Lote do

  it "deve conter trailer e header" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V40')
    expect(lote.header).to be_an_instance_of(Cnab240::V40::Pagamentos::Header)
    expect(lote.trailer).to be_an_instance_of(Cnab240::V40::Pagamentos::Trailer)
  end

  it "deve conter segmento a" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V40')
    lote << :a
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V40::SegmentoA)
  end

  it "linhas devem ter 240" do
    lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V40')
    lote.linhas.each do |linha|
      expect(linha.length).to be(240)
    end
  end
end