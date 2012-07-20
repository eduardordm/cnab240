require 'spec_helper'

include Cnab240::V86

describe SegmentoB do

	it "deve instanciar segmento" do
		segmento = SegmentoB.new
		segmento.should be_an_instance_of(SegmentoB)
	end

	it "deve conter campos" do
		segmento = SegmentoB.new

		segmento.should respond_to(:controle_banco)
		segmento.should respond_to(:controle_lote)
		segmento.should respond_to(:controle_registro)

		segmento.should respond_to(:servico_numero_registro)
		segmento.should respond_to(:servico_codigo_segmento)

		segmento.should respond_to(:cnab240_g004_1)

		segmento.should respond_to(:favorecido_inscricao_tipo)
		segmento.should respond_to(:favorecido_inscricao_numero)
		segmento.should respond_to(:favorecido_endereco_logradouro)
		segmento.should respond_to(:favorecido_endereco_numero)
		segmento.should respond_to(:favorecido_endereco_complemento)
		segmento.should respond_to(:favorecido_endereco_bairro)
		segmento.should respond_to(:favorecido_endereco_cidade)
		segmento.should respond_to(:favorecido_endereco_cep)
		segmento.should respond_to(:favorecido_endereco_cep_complemento)
		segmento.should respond_to(:favorecido_endereco_estado)

		segmento.should respond_to(:pagamento_data_vencimento)
		segmento.should respond_to(:pagamento_valor_documento)
		segmento.should respond_to(:pagamento_valor_abatimento)
		segmento.should respond_to(:pagamento_valor_desconto)
		segmento.should respond_to(:pagamento_valor_mora)
		segmento.should respond_to(:pagamento_valor_multa)

		segmento.should respond_to(:codigo_documento_favorecido)

		segmento.should respond_to(:aviso)

		segmento.should respond_to(:codigo_ug)

		segmento.should respond_to(:cnab_g004_2)

	end


	it "deve ter 240 caracteres" do
		segmento = SegmentoB.new
		segmento.linha.length.should be(240)
	end

	it "deve manter coesao" do 
		c = Cnab240::V86::SegmentoB
		obj = c.new
		linha1 = obj.linha
		obj2 = c.read(linha1)
		linha2 = obj2.linha
		linha1.should eq linha2
	end

end