require 'spec_helper'

include Cnab240::V60

describe Cnab240::V60::SegmentoB do

  it "deve instanciar segmento" do
    segmento = Cnab240::V60::SegmentoB.new
    expect(segmento).to be_an_instance_of(Cnab240::V60::SegmentoB)
  end

  it "deve conter campos" do
    segmento = Cnab240::V60::SegmentoB.new

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)

    expect(segmento).to respond_to(:cnab240_g004_1)

    expect(segmento).to respond_to(:favorecido_inscricao_tipo)
    expect(segmento).to respond_to(:favorecido_inscricao_numero)
    expect(segmento).to respond_to(:favorecido_endereco_logradouro)
    expect(segmento).to respond_to(:favorecido_endereco_numero)
    expect(segmento).to respond_to(:favorecido_endereco_complemento)
    expect(segmento).to respond_to(:favorecido_endereco_bairro)
    expect(segmento).to respond_to(:favorecido_endereco_cidade)
    expect(segmento).to respond_to(:favorecido_endereco_cep)
    expect(segmento).to respond_to(:favorecido_endereco_estado)

    expect(segmento).to respond_to(:pagamento_data_vencimento)
    expect(segmento).to respond_to(:pagamento_valor_documento)
    expect(segmento).to respond_to(:pagamento_valor_abatimento)
    expect(segmento).to respond_to(:pagamento_valor_desconto)
    expect(segmento).to respond_to(:pagamento_valor_mora)
    expect(segmento).to respond_to(:pagamento_valor_multa)

    expect(segmento).to respond_to(:documento_favorecido)
    expect(segmento).to respond_to(:aviso)
    expect(segmento).to respond_to(:agencia_centralizadora)
    expect(segmento).to respond_to(:cnab240_g004_2)
  end

  it "deve ter 240 caracteres" do
    segmento = Cnab240::V60::SegmentoB.new
    expect(segmento.linha.length).to be(240)
  end

  it "deve manter coesao" do
    c = Cnab240::V60::SegmentoB
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end