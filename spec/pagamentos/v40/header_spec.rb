require 'spec_helper'

describe Cnab240::V40::Pagamentos::Header do

	it "deve conter campos header" do
		header = Cnab240::V40::Pagamentos::Header.new

		header.should respond_to(:controle_banco)
		header.should respond_to(:controle_lote)
		header.should respond_to(:controle_registro)

		header.should respond_to(:servico_operacao)
		header.should respond_to(:servico_tipo)
		header.should respond_to(:servico_forma)
		header.should respond_to(:servico_layout)

		header.should respond_to(:cnab_g004_1)
		header.should respond_to(:empresa_tipo)
		header.should respond_to(:empresa_numero)
		header.should respond_to(:empresa_convenio)


		header.should respond_to(:brancos_1)
		header.should respond_to(:brancos_2)


		header.should respond_to(:empresa_agencia_codigo)

		header.should respond_to(:brancos_3)
		header.should respond_to(:brancos_4)

		header.should respond_to(:empresa_conta_numero)

		header.should respond_to(:brancos_5)

		header.should respond_to(:empresa_agencia_conta_dv)
		header.should respond_to(:empresa_nome)

		header.should respond_to(:informacao_1)

		header.should respond_to(:endereco_logradouro)
		header.should respond_to(:endereco_numero)
		header.should respond_to(:endereco_complemento)
		header.should respond_to(:endereco_cidade)
		header.should respond_to(:endereco_cep)
		header.should respond_to(:endereco_estado)

		header.should respond_to(:cnab_g004_2)
		header.should respond_to(:ocorrencias)

	end


	it "header deve ter 240 caracteres" do
		header = Cnab240::V40::Pagamentos::Header.new
		header.linha.length.should be(240)
	end

end