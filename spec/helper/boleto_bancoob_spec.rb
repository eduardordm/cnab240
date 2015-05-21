# -*- encoding: utf-8 -*-
require 'spec_helper'

include Cnab240

RSpec.describe BoletoSicoob do

  let(:arquivo_read) { File.read('./spec/fixtures/remessa/sicoob_240_boletos.CED') }

  it 'deve criar remessa boleto igual ao programa do bancoob' do
    boleto = {
      beneficiario_agencia_codigo: '04444',
      beneficiario_agencia_dv: nil,
      beneficiario_conta_numero: '6666',
      beneficiario_conta_dv: '6',
      nosso_numero: '6018',
      parcela: '01',
      modalidade: '01',
      tipo_formulario: '4',
      codigo_carteira: '1',
      numero_documento: '1',
      data_vencimento: '31102013',
      valor: '200',
      especie_titulo: '02',
      data_emissao: '24102013',
      juros_mora: '1',
      valor_juros_mora: '100',
      codigo_desconto_1: '1',
      data_desconto_1: '25102013',
      valor_desconto_1: '20',
      valor_iof: '120',
      valor_abatimento: '110',
      pagador_inscricao_tipo: '1',
      pagador_inscricao_numero: '000001023478129',
      pagador_nome: 'KKKKKKK BBBBBBB AAAAAAA',
      pagador_endereco_logradouro: 'RUA RRRRRO, C 1, QD 5, TT 2',
      pagador_endereco_bairro: 'AAA III',
      pagador_endereco_cep: '77777',
      pagador_endereco_cep_complemento: '777',
      pagador_endereco_cidade: 'Cidade',
      pagador_endereco_estado: 'MT',
      avalista_inscricao_tipo: '1',
      avalista_inscricao_numero: '000001023478129',
      avalista_nome: 'KKKKKKK BBBBBBB AAAAAAA',
      codigo_desconto_2: '1',
      data_desconto_2: '29102013',
      valor_desconto_2: '10',
      codigo_multa: '1',
      valor_multa: '101',
      informacao_3: 'FATURA COBREGRATIS.COM.BR',
      tipo_impressao: '3',
      informacao_5: 'COBRAR MULTA R$ 1,01 APOS  3  DIAS',
      informacao_6: 'NAO RECEBER APOS 30 DIAS',
      empresa_tipo: '2',
      empresa_numero: '05813794000126',
      empresa_nome: 'BIELSYSTEMS TECNOLOGIA LTDA -',
      empresa_agencia_codigo: '04444',
      empresa_agencia_dv: nil,
      empresa_conta_numero: '6666',
      empresa_conta_dv: '6',
      arquivo_sequencia: '1',
      endereco_logradouro: 'AV BRASIL',
      endereco_numero: '123',
      endereco_cidade: 'RIO DE JANEIRO',
      endereco_cep: '12123412',
      endereco_estado: 'RJ',
      arquivo_data_geracao: '23032014',
      arquivo_hora_geracao: '221716',
      controle_cobranca: '1',
      data_geracao: '24102013'
    }

    # Cria boleto já com 1 lote criado
    arquivo = BoletoSicoob.new(boleto)

    # Adiciona primeiro lote
    arquivo.add_lote(boleto)

    # adiciona boletos no último lote criado
    arquivo << boleto # primeiro boleto

    expect(arquivo.arquivo.header.banco_nome.strip).to eq 'BANCO COOPERATIVO DO BRASIL S/'
    expect(arquivo.string).to eq(arquivo_read)
  end
end
