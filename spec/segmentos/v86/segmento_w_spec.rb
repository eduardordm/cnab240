require 'spec_helper'

include Cnab240::V86

describe SegmentoW do

	it "deve instanciar segmento" do
		segmento = SegmentoW.new
		segmento.should be_an_instance_of(SegmentoW)
	end

	it "deve conter campos" do
		segmento = SegmentoW.new

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)


		segmento.should respond_to(:complemento)

		segmento.should respond_to(:uso_informacoes_1_e_2)
		segmento.should respond_to(:informacao_1)
		segmento.should respond_to(:informacao_2)

		segmento.should respond_to(:w1)

		segmento.should respond_to(:reservado)
		segmento.should respond_to(:ocorrencias)


	end

	it "deve ter 240 caracteres" do
		segmento = SegmentoW.new
		segmento.linha.length.should be(240)
	end

	it "deve manter coesao" do 
		c = SegmentoW
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end