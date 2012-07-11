require 'spec_helper'

include Cnab240

describe SegmentoC do

	it "deve instanciar segmento" do
		segmento = SegmentoC.new
		segmento.should be_an_instance_of(SegmentoC)
	end

	it "deve conter campos" do
		segmento = SegmentoC.new

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)

		segmento.should respond_to(:cnab240_g004_1)

		segmento.should respond_to(:complementar_valor_ir)
		segmento.should respond_to(:complementar_valor_iss)
		segmento.should respond_to(:complementar_valor_iof)
		segmento.should respond_to(:complementar_valor_outras_deducoes)
		segmento.should respond_to(:complementar_valor_outros_acrescimos)

		segmento.should respond_to(:substituta_agencia)
		segmento.should respond_to(:substituta_agencia_dv)
		segmento.should respond_to(:substituta_numero_cc)
		segmento.should respond_to(:substituta_conta_dv)
		segmento.should respond_to(:substituta_agencia_conta_dv)

		segmento.should respond_to(:valor_inss)

		segmento.should respond_to(:cnab_g004_2)
	end

	it "deve ter 240 caracteres" do
		segmento = SegmentoC.new
		segmento.linha.length.should be(240)
	end

end