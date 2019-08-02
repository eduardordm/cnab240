# -*- encoding: utf-8 -*-
require 'spec_helper'

include Cnab240

RSpec.describe PagamentoMultipag do
  it 'deve criar pagamento' do
    favorecido = {
      favorecido_banco: '001',
      favorecido_agencia_codigo: '4444',
      favorecido_conta_numero: '8888',
      favorecido_conta_dv: '0',
      credito_seu_numero: '1',
      credito_data_pagamento: '05082014',
      credito_valor_pagamento: '102',
      pagamento_valor_documento: '102',
      favorecido_nome: 'JOAO BARBOSA',
      favorecido_inscricao_tipo: '1',
      favorecido_inscricao_numero: '00022233344',
      favorecido_endereco_logradouro: 'Av. Pres. Vargas'
    }

    # servico_forma
    # '01' = Crédito em Conta Corrente
    # '02' = Cheque Pagamento / Administrativo
    # '03' = DOC/TED (1)
    # '31' = Pagamento de Títulos de Outros Bancos
    #
    # servico_tipo
    # '20' = Pagamento Fornecedor '30' = Pagamento Salários
    beneficiario = {
      empresa_numero: '111222000126',
      empresa_nome: 'MINHA EMPRESA LTDA',
      empresa_agencia_codigo: '00013',
      empresa_conta_numero: '000004007078',
      arquivo_sequencia: '1',
      endereco_logradouro: 'AV BRASIL',
      endereco_numero: '123',
      endereco_cidade: 'RIO DE JANEIRO',
      endereco_cep: '12123412',
      endereco_estado: 'RJ',
      servico_tipo: '20',
      servico_forma: '03'
    }

    # Cria pagamento já com 1 lote criado
    pagamento = PagamentoMultipag.new(beneficiario)

    # Adiciona primeiro lote
    pagamento.add_lote(beneficiario)

    # adiciona pagamentos no último lote criado
    pagamento << favorecido # primeiro pagamento
    pagamento << favorecido.merge(credito_valor_pagamento: '202',
                                  pagamento_valor_documento: '202',
                                  credito_seu_numero: '2') # segundo pagamento

    # Adiciona segundo lote
    pagamento.add_lote(beneficiario.merge(servico_forma: '01'))

    # adiciona pagamentos no último lote criado
    pagamento << favorecido.merge(credito_valor_pagamento: '502',
                                  pagamento_valor_documento: '502',
                                  credito_seu_numero: '3',
                                  favorecido_banco: '000')

    expect(pagamento.arquivo.header.banco_nome.strip).to eq 'BANCO BRADESCO'
    expect(pagamento.arquivo.header.arquivo_layout.strip). to eq '089'
  end
end
