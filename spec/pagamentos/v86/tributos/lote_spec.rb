require 'spec_helper'

describe Cnab240::Lote do

	it "deve conter trailer e header" do
		lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
		lote.header.should be_an_instance_of(Cnab240::V86::PagamentosTributos::Header)	
		lote.trailer.should be_an_instance_of(Cnab240::V86::PagamentosTributos::Trailer)
	end

	it "deve conter segmento o" do
		lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
		lote.segmento_o.should be_an_instance_of(Cnab240::V86::SegmentoO)
	end

	it "deve conter segmento n" do
		lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
		lote.segmento_n.should be_an_instance_of(Cnab240::V86::SegmentoN)
	end

	it "pode conter segmento w" do
		lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
		lote << :w
		lote.should respond_to(:segmento_w)
	end

	it "pode conter segmento z" do
		lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
		lote << :z
		lote.should respond_to(:segmento_z)
	end

	it "linhas devem ter 240" do
		lote = Cnab240::Lote.new(:operacao => :pagamento_titulo_tributos, :tipo => :remessa)
		lote.linhas.each do |linha|
			linha.length.should be(240)
		end
	end


end