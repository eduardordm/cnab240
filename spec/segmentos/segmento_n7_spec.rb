require 'spec_helper'

include Cnab240

describe SegmentoN7 do

	it "deve instanciar segmento" do
		segmento = SegmentoN7.new
		segmento.should be_an_instance_of(SegmentoN7)
	end

	it "deve conter campos" do
		segmento = SegmentoN7.new

		segmento.should respond_to(:receita)
		segmento.should respond_to(:tipo_identificacao_contribuinte)
		segmento.should respond_to(:identificacao_contribuinte)
		segmento.should respond_to(:identificacao_tributo)
		
		segmento.should respond_to(:exercicio)
		segmento.should respond_to(:renavam)
		segmento.should respond_to(:uf)
		segmento.should respond_to(:municipio)
		segmento.should respond_to(:placa)
		segmento.should respond_to(:opcao_pagamento)
		segmento.should respond_to(:opcao_retirada)

		segmento.should respond_to(:cnab)

	end

	it "deve ter 120 caracteres" do
		segmento = SegmentoN7.new
		segmento.linha.length.should be(120)
	end

	it "deve manter coesao" do 
		c = Cnab240::SegmentoN7
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end