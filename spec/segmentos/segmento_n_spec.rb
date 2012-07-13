require 'spec_helper'

include Cnab240

describe SegmentoN do

	it "deve instanciar segmento" do
		segmento = SegmentoN.new
		segmento.should be_an_instance_of(SegmentoN)
	end

	it "deve conter campos" do
		segmento = SegmentoN.new

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)
		segmento.should respond_to(:servico_tipo_movimento)
		segmento.should respond_to(:servico_codigo_movimento)

		segmento.should respond_to(:nosso_numero)
		segmento.should respond_to(:contribuinte)
		segmento.should respond_to(:data_pagamento)
		segmento.should respond_to(:valor_pagamento)

		segmento.should respond_to(:informacoes_complementares)

		segmento.should respond_to(:ocorrencias)
	end

	it "deve ter 240 caracteres" do
		segmento = SegmentoN.new
		segmento.linha.length.should be(240)
	end

end