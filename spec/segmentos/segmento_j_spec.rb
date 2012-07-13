require 'spec_helper'

include Cnab240

describe SegmentoJ do

	it "deve instanciar segmento" do
		segmento = SegmentoJ.new
		segmento.should be_an_instance_of(SegmentoJ)
	end

	it "deve conter campos" do
		segmento = SegmentoJ.new

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)
		segmento.should respond_to(:servico_tipo_movimento)
		segmento.should respond_to(:servico_codigo_movimento)

		segmento.should respond_to(:codigo_barras)
		segmento.should respond_to(:nome_cedente)
		segmento.should respond_to(:data_vencimento)
		segmento.should respond_to(:valor_titulo)
		segmento.should respond_to(:valor_desconto_abatimento)
		segmento.should respond_to(:valor_mora_juros)
		segmento.should respond_to(:data_pagamento)
		segmento.should respond_to(:quantidade_moeda)
		segmento.should respond_to(:referencia_sacado)

		segmento.should respond_to(:nosso_numero)
		segmento.should respond_to(:codigo_moeda)

		segmento.should respond_to(:cnab_g004_1)
		segmento.should respond_to(:ocorrencias)
	end

	it "deve ter 240 caracteres" do
		segmento = SegmentoJ.new
		segmento.linha.length.should be(240)
	end

end