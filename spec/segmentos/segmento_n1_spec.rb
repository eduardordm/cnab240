require 'spec_helper'

include Cnab240

describe SegmentoN1 do

	it "deve instanciar segmento" do
		segmento = SegmentoN1.new
		segmento.should be_an_instance_of(SegmentoN1)
	end

	it "deve conter campos" do
		segmento = SegmentoN1.new

		segmento.should respond_to(:receita)
		segmento.should respond_to(:tipo_identificacao_contribuinte)
		segmento.should respond_to(:identificacao_contribuinte)
		segmento.should respond_to(:identificacao_tributo)
		
		segmento.should respond_to(:mes_ano_competencia)
		segmento.should respond_to(:valor_tributo)
		segmento.should respond_to(:valor_outras_entidades)
		segmento.should respond_to(:atualizacao_monetaria)

		segmento.should respond_to(:cnab)

	end

	it "deve ter 120 caracteres" do
		segmento = SegmentoN1.new
		segmento.linha.length.should be(120)
	end

	it "deve manter coesao" do 
		c = Cnab240::SegmentoN1
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end