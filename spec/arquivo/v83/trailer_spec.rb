require 'spec_helper'

describe Cnab240::V83::Arquivo::Trailer do

  it "deve conter campos trailer" do
    header = Cnab240::V83::Arquivo::Trailer.new

    expect(header).to respond_to(:controle_banco)
    expect(header).to respond_to(:controle_lote)
    expect(header).to respond_to(:controle_registro)

    expect(header).to respond_to(:cnab_g004_1)

    expect(header).to respond_to(:totais_qtde_lotes)
    expect(header).to respond_to(:totais_qtde_registros)

    expect(header).to respond_to(:cnab_g004_2)
  end

  it "trailer deve ter 240 caracteres" do
    trailer = Cnab240::V83::Arquivo::Trailer.new
    expect(trailer.linha.length).to be(240)
  end
end