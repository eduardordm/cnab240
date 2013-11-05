require 'spec_helper'

describe Cnab240::V80::Pagamentos::Trailer do

	it "deve conter campos trailer" do
		trailer = Cnab240::V80::Pagamentos::Trailer.new

		trailer.should respond_to(:controle_banco)
		trailer.should respond_to(:controle_lote)
		trailer.should respond_to(:controle_registro)

		trailer.should respond_to(:registro_trailer)

		trailer.should respond_to(:totais_qtde_registros)
		trailer.should respond_to(:totais_valor)
		trailer.should respond_to(:zeros)

		trailer.should respond_to(:cnab_g004_2)

		trailer.should respond_to(:ocorrencias)
	end

	it "trailer deve ter 240 caracteres" do
		trailer = Cnab240::V80::Pagamentos::Trailer.new
		trailer.linha.length.should be(240)
	end

end