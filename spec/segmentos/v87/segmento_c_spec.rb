require 'spec_helper'

include Cnab240::V87

RSpec.describe Cnab240::V87::SegmentoC do
  it 'deve instanciar segmento' do
    segmento = Cnab240::V87::SegmentoC.new
    expect(segmento).to be_an_instance_of(Cnab240::V87::SegmentoC)
  end

  it 'deve conter campos' do
    segmento = Cnab240::V87::SegmentoC.new

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)

    expect(segmento).to respond_to(:cnab240_g004_1)

    expect(segmento).to respond_to(:complementar_valor_ir)
    expect(segmento).to respond_to(:complementar_valor_iss)
    expect(segmento).to respond_to(:complementar_valor_iof)
    expect(segmento).to respond_to(:complementar_valor_outras_deducoes)
    expect(segmento).to respond_to(:complementar_valor_outros_acrescimos)

    expect(segmento).to respond_to(:substituta_agencia)
    expect(segmento).to respond_to(:substituta_agencia_dv)
    expect(segmento).to respond_to(:substituta_numero_cc)
    expect(segmento).to respond_to(:substituta_conta_dv)
    expect(segmento).to respond_to(:substituta_agencia_conta_dv)

    expect(segmento).to respond_to(:valor_inss)

    expect(segmento).to respond_to(:cnab_g004_2)
  end

  it 'deve ter 240 caracteres' do
    segmento = Cnab240::V87::SegmentoC.new
    expect(segmento.linha.length).to be(240)
  end

  it 'deve manter coesao' do
    c = Cnab240::V87::SegmentoC
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end
