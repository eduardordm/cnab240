require 'spec_helper'

include Cnab240

describe SegmentoZ do

	it "deve instanciar segmento" do
		segmento = SegmentoZ.new
		segmento.should be_an_instance_of(SegmentoZ)
	end

	it "deve conter campos" do
		segmento = SegmentoZ.new

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)

		segmento.should respond_to(:autenticacao)
		segmento.should respond_to(:controle_bancario)
		segmento.should respond_to(:cnab_g004_1)
		segmento.should respond_to(:ocorrencias)
	end

	it "deve ter 240 caracteres" do
		segmento = SegmentoZ.new
		segmento.linha.length.should be(240)
	end

end