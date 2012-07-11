require 'spec_helper'


describe Cnab240::Arquivo::Header do

	it "deve ter campos de header" do
		header = Cnab240::Arquivo::Header.new

		header.should respond_to(:controle_banco)
		header.should respond_to(:controle_lote)
		header.should respond_to(:controle_registro)

		header.should respond_to(:cnab_g004_1)

		header.should respond_to(:empresa_tipo)
		header.should respond_to(:empresa_numero)
		header.should respond_to(:empresa_convenio)
		header.should respond_to(:empresa_agencia_codigo)
		header.should respond_to(:empresa_agencia_dv)
		header.should respond_to(:empresa_conta_numero)
		header.should respond_to(:empresa_conta_dv)
		header.should respond_to(:empresa_agencia_conta_dv)
		header.should respond_to(:empresa_nome)

		header.should respond_to(:banco_nome)

		header.should respond_to(:cnab_g004_2)

		header.should respond_to(:arquivo_codigo)
		header.should respond_to(:arquivo_data_geracao)
		header.should respond_to(:arquivo_hora_geracao)
		header.should respond_to(:arquivo_sequencia)
		header.should respond_to(:arquivo_layout)
		header.should respond_to(:arquivo_densidade)

		header.should respond_to(:reservado_banco)
		header.should respond_to(:reservado_empresa)

		header.should respond_to(:cnab_g004_3)
	end
end