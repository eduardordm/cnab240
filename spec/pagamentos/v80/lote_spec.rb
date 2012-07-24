require 'spec_helper'

describe Cnab240::Lote do

	it "deve conter trailer e header" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V80')
		lote.header.should be_an_instance_of(Cnab240::V80::Pagamentos::Header)	
		lote.trailer.should be_an_instance_of(Cnab240::V80::Pagamentos::Trailer)
	end

	it "deve conter segmento a" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V80')
		lote << :a
		lote.segmentos[0].should be_an_instance_of(Cnab240::V80::SegmentoA)
	end

	it "linhas devem ter 240" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V80')
		lote.linhas.each do |linha|
			linha.length.should be(240)
		end
	end


end