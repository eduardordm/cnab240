require 'spec_helper'

include Cnab240::V81

RSpec.describe Cnab240::V81::SegmentoQ do
  it 'deve instanciar segmento' do
    segmento = Cnab240::V81::SegmentoQ.new
    expect(segmento).to be_an_instance_of(Cnab240::V81::SegmentoQ)
  end

  it 'deve conter campos' do
    segmento = Cnab240::V81::SegmentoQ.new

    expect(segmento).to respond_to(:controle_banco)
    expect(segmento).to respond_to(:controle_lote)
    expect(segmento).to respond_to(:controle_registro)

    expect(segmento).to respond_to(:servico_numero_registro)
    expect(segmento).to respond_to(:servico_codigo_segmento)
    expect(segmento).to respond_to(:servico_tipo_movimento)
    expect(segmento).to respond_to(:servico_codigo_movimento)

    expect(segmento).to respond_to(:pagador_inscricao_tipo)
    expect(segmento).to respond_to(:pagador_inscricao_numero)
    expect(segmento).to respond_to(:pagador_nome)
    expect(segmento).to respond_to(:pagador_endereco_logradouro)
    expect(segmento).to respond_to(:pagador_endereco_bairro)
    expect(segmento).to respond_to(:pagador_endereco_cep)
    expect(segmento).to respond_to(:pagador_endereco_cep_complemento)
    expect(segmento).to respond_to(:pagador_endereco_cidade)
    expect(segmento).to respond_to(:pagador_endereco_estado)

    expect(segmento).to respond_to(:avalista_inscricao_tipo)
    expect(segmento).to respond_to(:avalista_inscricao_numero)
    expect(segmento).to respond_to(:avalista_nome)
    expect(segmento).to respond_to(:banco_correspondente)
    expect(segmento).to respond_to(:banco_correspondente_nosso_numero)
    expect(segmento).to respond_to(:cnab_g004_1)
  end

  it 'deve ter 240 caracteres' do
    segmento = Cnab240::V81::SegmentoQ.new
    expect(segmento.linha.length).to be(240)
  end

  it 'deve manter coesao' do
    c = Cnab240::V81::SegmentoQ
    obj = c.new
    linha1 = obj.linha
    obj2 = c.read(linha1)
    linha2 = obj2.linha
    expect(linha1).to eq linha2
  end
end
