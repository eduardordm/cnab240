require 'spec_helper'

describe Cnab240::Pagamentos::Lote do

	it "deve conter trailer e header" do
		lote = Cnab240::Pagamentos::Lote.new
		lote.header.should be_an_instance_of(Cnab240::Pagamentos::Header)	
		lote.trailer.should be_an_instance_of(Cnab240::Pagamentos::Trailer)
	end

	it "deve conter segmento a" do
		lote = Cnab240::Pagamentos::Lote.new
		lote.segmento_a.should be_an_instance_of(Cnab240::SegmentoA)
	end

	it "deve conter segmento b" do
		lote = Cnab240::Pagamentos::Lote.new
		lote.segmento_b.should be_an_instance_of(Cnab240::SegmentoB)
	end

	it "pode conter segmento c" do
		lote = Cnab240::Pagamentos::Lote.new
		lote.should respond_to(:segmento_c)
	end

end