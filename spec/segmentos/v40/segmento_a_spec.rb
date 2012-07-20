require 'spec_helper'

include Cnab240::V40

describe SegmentoA do

	it "deve instanciar segmento" do
		segmento = SegmentoA.new
		segmento.should be_an_instance_of(SegmentoA)
	end

	it "deve conter campos" do
		segmento = SegmentoA.new

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)
		segmento.should respond_to(:servico_tipo_movimento)
		segmento.should respond_to(:servico_codigo_movimento)

		segmento.should respond_to(:favorecido_camara)
		segmento.should respond_to(:favorecido_banco)
		segmento.should respond_to(:favorecido_agencia_codigo)
		segmento.should respond_to(:favorecido_agencia_dv)
		segmento.should respond_to(:favorecido_conta_numero)
		segmento.should respond_to(:favorecido_conta_dv)
		segmento.should respond_to(:favorecido_nome)

		segmento.should respond_to(:credito_seu_numero)
		segmento.should respond_to(:credito_data_pagamento)
		segmento.should respond_to(:credito_moeda_tipo)
		segmento.should respond_to(:credito_moeda_quantidade)
		segmento.should respond_to(:credito_valor_pagamento)
		segmento.should respond_to(:credito_nosso_numero)
		segmento.should respond_to(:credito_data_real)
		segmento.should respond_to(:credito_valor_real)

		segmento.should respond_to(:informacao_2)

		segmento.should respond_to(:codigo_finalidade_doc)
		segmento.should respond_to(:codigo_finalidade_ted)
		segmento.should respond_to(:codigo_finalidade_complementar)
		segmento.should respond_to(:cnab_g004_1)
		segmento.should respond_to(:aviso)
		segmento.should respond_to(:ocorrencias)
	end

	it "deve ter 240 caracteres" do
		segmento = SegmentoA.new
		segmento.linha.length.should be(240)
	end

	it "deve manter coesao" do 
		c = Cnab240::V40::SegmentoA
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end