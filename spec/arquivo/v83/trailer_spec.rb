require 'spec_helper'

describe Cnab240::V83::Arquivo::Trailer do

  it "deve conter campos trailer" do
    header = Cnab240::V83::Arquivo::Trailer.new

    header.should respond_to(:controle_banco)
    header.should respond_to(:controle_lote)
    header.should respond_to(:controle_registro)

    header.should respond_to(:cnab_g004_1)

    header.should respond_to(:totais_qtde_lotes)
    header.should respond_to(:totais_qtde_registros)

    header.should respond_to(:cnab_g004_2)
  end

  it "trailer deve ter 240 caracteres" do
    trailer = Cnab240::V83::Arquivo::Trailer.new
    trailer.linha.length.should be(240)
  end
end