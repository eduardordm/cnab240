require 'spec_helper'

describe Cnab240::V80::Arquivo::Header do

	it "deve ter campos de header" do
		header = Cnab240::V80::Arquivo::Header.new

		header.should respond_to(:controle_banco)
		header.should respond_to(:controle_lote)
		header.should respond_to(:controle_registro)

		header.should respond_to(:brancos_1)
		header.should respond_to(:arquivo_layout)

		header.should respond_to(:empresa_tipo)
		header.should respond_to(:empresa_numero)

		header.should respond_to(:brancos_2)

		header.should respond_to(:empresa_agencia_codigo)
		header.should respond_to(:brancos_3)
		header.should respond_to(:empresa_conta_numero)
		header.should respond_to(:brancos_4)
		header.should respond_to(:empresa_agencia_conta_dv)
		header.should respond_to(:empresa_nome)
		header.should respond_to(:banco_nome)
		header.should respond_to(:brancos_5)

		header.should respond_to(:arquivo_codigo)
		header.should respond_to(:arquivo_data_geracao)
		header.should respond_to(:arquivo_hora_geracao)
		
		#header.should respond_to(:brancos_6)
		header.should respond_to(:zeros_6)

		header.should respond_to(:arquivo_densidade)

		header.should respond_to(:brancos_7)
	end

	it "header deve ter 240 caracteres" do
		header = Cnab240::V80::Arquivo::Header.new
		header.linha.length.should be(240)
	end

	it "conversao deve manter consistencia" do 
		header = Cnab240::V80::Arquivo::Header.new

		header.controle_banco= "8"
		header.controle_lote= "8"
		header.controle_registro= "8"


		linha1 = header.linha

		header2 = Cnab240::V80::Arquivo::Header.read(linha1)
		linha2 = header2.linha
		
		linha1.should eq linha2
	end
end