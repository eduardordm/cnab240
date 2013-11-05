require 'spec_helper'

include Cnab240::V80

describe Cnab240::V80::SegmentoA do

	it "deve instanciar segmento" do
		segmento = Cnab240::V80::SegmentoA.new
		segmento.should be_an_instance_of(Cnab240::V80::SegmentoA)
	end

	it "deve conter campos" do
		segmento = Cnab240::V80::SegmentoA.new

		segmento.should respond_to(:controle_banco)

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)
		segmento.should respond_to(:servico_tipo_movimento)
		segmento.should respond_to(:zeros_1)

		segmento.should respond_to(:favorecido_banco)
		segmento.should respond_to(:favorecido_agencia_conta)
		segmento.should respond_to(:favorecido_nome)
		segmento.should respond_to(:credito_seu_numero)
		segmento.should respond_to(:credito_data_pagamento)


		segmento.should respond_to(:credito_moeda_tipo)

		segmento.should respond_to(:zeros_2)
		segmento.should respond_to(:credito_valor_pagamento)
		segmento.should respond_to(:credito_nosso_numero)
		segmento.should respond_to(:brancos_1)

		segmento.should respond_to(:credito_data_real)
		segmento.should respond_to(:credito_valor_real)

		segmento.should respond_to(:finalidade_detalhe)
		segmento.should respond_to(:brancos_2)

		segmento.should respond_to(:numero_documento)
		segmento.should respond_to(:numero_inscricao)
		segmento.should respond_to(:codigo_finalidade_complementar)
		segmento.should respond_to(:finalidade_ted)
		segmento.should respond_to(:zeros_3)
		#segmento.should respond_to(:brancos_3)
		segmento.should respond_to(:aviso)
		segmento.should respond_to(:ocorrencias)

	end

	it "deve ter 240 caracteres" do
		segmento = Cnab240::V80::SegmentoA.new
		segmento.linha.length.should be(240)
	end

	it "deve manter coesao" do 
		c = Cnab240::V80::SegmentoA
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end