require 'spec_helper'

describe Cnab240::Lote do

	it "deve conter trailer e header" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		lote.header.should be_an_instance_of(Cnab240::V86::Pagamentos::Header)	
		lote.trailer.should be_an_instance_of(Cnab240::V86::Pagamentos::Trailer)
	end

	it "deve conter segmento a" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		lote.segmento_a.should be_an_instance_of(Cnab240::V86::SegmentoA)
	end

	it "deve conter segmento b" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		lote.segmento_b.should be_an_instance_of(Cnab240::V86::SegmentoB)
	end

	it "pode conter segmento c" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		lote << :c
		lote.should respond_to(:segmento_c)
	end

	it "linhas devem ter 240" do
		lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		lote.linhas.each do |linha|
			linha.length.should be(240)
		end
	end


end