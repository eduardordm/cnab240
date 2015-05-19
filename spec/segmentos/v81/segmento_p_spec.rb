require 'spec_helper'

include Cnab240::V81

RSpec.describe Cnab240::V81::SegmentoP do
  it 'deve instanciar segmento' do
    segmento = Cnab240::V81::SegmentoP.new
    expect(segmento).to be_an_instance_of(Cnab240::V81::SegmentoP)
  end

  it 'deve conter campos' do
    segmento = Cnab240::V81::SegmentoP.new

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)
    expect(segmento).to respond_to(:servico_tipo_movimento)
    expect(segmento).to respond_to(:servico_codigo_movimento)

    expect(segmento).to respond_to(:beneficiario_agencia_codigo)
    expect(segmento).to respond_to(:beneficiario_agencia_dv)
    expect(segmento).to respond_to(:beneficiario_conta_numero)
    expect(segmento).to respond_to(:beneficiario_conta_dv)
    expect(segmento).to respond_to(:beneficiario_agencia_conta_dv)

    expect(segmento).to respond_to(:nosso_numero)
    expect(segmento).to respond_to(:codigo_carteira)
    expect(segmento).to respond_to(:forma_cadastro)
    expect(segmento).to respond_to(:tipo_documento)
    expect(segmento).to respond_to(:emissao_boleto)
    expect(segmento).to respond_to(:distribuicao_boleto)
    expect(segmento).to respond_to(:numero_documento)
    expect(segmento).to respond_to(:data_vencimento)
    expect(segmento).to respond_to(:valor)
    expect(segmento).to respond_to(:agencia_cobradora)
    expect(segmento).to respond_to(:agencia_cobradora_dv)
    expect(segmento).to respond_to(:especie_titulo)
    expect(segmento).to respond_to(:aceite)
    expect(segmento).to respond_to(:data_emissao)

    expect(segmento).to respond_to(:juros_mora)
    expect(segmento).to respond_to(:data_juros_mora)
    expect(segmento).to respond_to(:valor_juros_mora)
    expect(segmento).to respond_to(:codigo_desconto_1)
    expect(segmento).to respond_to(:data_desconto_1)
    expect(segmento).to respond_to(:valor_desconto_1)
    expect(segmento).to respond_to(:valor_iof)
    expect(segmento).to respond_to(:valor_abatimento)
    expect(segmento).to respond_to(:identificacao_beneficiario)
    expect(segmento).to respond_to(:codigo_protesto)
    expect(segmento).to respond_to(:dias_protesto)
    expect(segmento).to respond_to(:codigo_baixa)
    expect(segmento).to respond_to(:dias_baixa)
    expect(segmento).to respond_to(:moeda)
    expect(segmento).to respond_to(:contrato_operacao_credito)
    expect(segmento).to respond_to(:cnab_g004_1)
  end

  it 'deve ter 240 caracteres' do
    segmento = Cnab240::V81::SegmentoP.new
    expect(segmento.linha.length).to be(240)
  end

  it 'deve manter coesao' do
    c = Cnab240::V81::SegmentoP
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end
