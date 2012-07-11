require 'spec_helper'


describe Cnab240::Arquivo::Trailer do

	it "deve conter campos trailer" do
		header = Cnab240::Arquivo::Trailer.new

		header.should respond_to(:controle_banco)
		header.should respond_to(:controle_lote)
		header.should respond_to(:controle_registro)

		header.should respond_to(:cnab_g004_1)

		header.should respond_to(:totais_qtde_lotes)
		header.should respond_to(:totais_qtde_registros)
		header.should respond_to(:totais_qtde_contas_concil)

		header.should respond_to(:cnab_g004_2)
	end

end