require 'spec_helper'

RSpec.describe Cnab240::V86::PagamentosTitulos::Trailer do

  it "deve conter campos trailer" do
    trailer = Cnab240::V86::PagamentosTitulos::Trailer.new

    expect(trailer).to respond_to(:controle_banco)
    expect(trailer).to respond_to(:controle_lote)
    expect(trailer).to respond_to(:controle_registro)

    expect(trailer).to respond_to(:cnab_g004_1)

    expect(trailer).to respond_to(:totais_qtde_registros)
    expect(trailer).to respond_to(:totais_valor)
    expect(trailer).to respond_to(:totais_qtde_moeda)

    expect(trailer).to respond_to(:numero_aviso_debito)

    expect(trailer).to respond_to(:cnab_g004_2)

    expect(trailer).to respond_to(:ocorrencias)
  end

  it "trailer deve ter 240 caracteres" do
    trailer = Cnab240::V86::PagamentosTitulos::Trailer.new
    expect(trailer.linha.length).to be(240)
  end

end