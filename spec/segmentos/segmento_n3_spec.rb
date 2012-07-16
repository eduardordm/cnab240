require 'spec_helper'

include Cnab240

describe SegmentoN3 do

	it "deve instanciar segmento" do
		segmento = SegmentoN3.new
		segmento.should be_an_instance_of(SegmentoN3)
	end

	it "deve conter campos" do
		segmento = SegmentoN3.new

		segmento.should respond_to(:receita)
		segmento.should respond_to(:tipo_identificacao_contribuinte)
		segmento.should respond_to(:identificacao_contribuinte)
		segmento.should respond_to(:identificacao_tributo)
		
		segmento.should respond_to(:periodo_apuracao)
		segmento.should respond_to(:receita_bruta)
		segmento.should respond_to(:percentual)
		segmento.should respond_to(:valor_principal)
		segmento.should respond_to(:valor_multa)
		segmento.should respond_to(:valor_juros_encargos)

		segmento.should respond_to(:cnab)

	end

	it "deve ter 120 caracteres" do
		segmento = SegmentoN3.new
		segmento.linha.length.should be(120)
	end

	it "deve manter coesao" do 
		c = Cnab240::SegmentoN3
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end