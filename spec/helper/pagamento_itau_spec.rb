require 'spec_helper'

include Cnab240

RSpec.describe PagamentoItau do
  it 'deve criar pagamento' do
    pagamento = PagamentoItau.new(
      empresa_convenio: '1234',
      empresa_tipo: '2',
      empresa_numero: '01234567891234',
      empresa_nome: 'EMPRESA FULANA',
      empresa_agencia_codigo: '',
      empresa_conta_numero: '',
      empresa_agencia_conta_dv: '',
      arquivo_sequencia: '1',
      endereco_logradouro: 'AV BRASIL',
      endereco_numero: '123',
      endereco_cidade: 'RIO DE JANEIRO',
      endereco_cep: '12123412',
      endereco_estado: 'RJ',
      servico_tipo: '98', # pagamentos - diversos
      servico_forma: '03', # doc, ted, etc
    )

    pagamento << {
      favorecido_banco: '001',
      favorecido_agencia: '2290',
      favorecido_conta: '335959',
      credito_seu_numero: '1234',
      credito_data_pagamento: '31122012',
      credito_valor_pagamento: '100',
      numero_inscricao: '12312312312312',
      favorecido_nome: 'EMPRESA X'
    }

    pagamento << {
      favorecido_banco: '001',
      favorecido_agencia: '2290',
      favorecido_conta: '335959',
      credito_seu_numero: '1234',
      credito_data_pagamento: '31122012',
      credito_valor_pagamento: '100',
      numero_inscricao: '12312312312312',
      favorecido_nome: 'EMPRESA X'
    }

    pagamento.add_lote(
      servico_tipo: '98', # pagamentos - diversos
      servico_forma: '03' # doc, ted, et
    )

    pagamento << {
      favorecido_banco: '001',
      favorecido_agencia: '2290',
      favorecido_conta: '335959',
      credito_seu_numero: '1234',
      credito_data_pagamento: '31122012',
      credito_valor_pagamento: '100',
      numero_inscricao: '12312312312312',
      favorecido_nome: 'EMPRESA X'
    }

    expect(pagamento.arquivo.header.banco_nome.strip).to eq 'BANCO ITAU'

    # Simulando arquivo de escrita
    io = StringIO.new('', 'w+')
    io.write(pagamento.string)

    pagamento.string
  end

  it 'deve carregar arquivo de retorno do ITAU' do
    arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file('./spec/fixtures/retorno/SB22112AIT.RET')[0]

    expect(arquivo_read.lotes.length).to be 1

    arquivo_read.lotes.each_with_index do |lote_read, _i|
      expect(lote_read.header.empresa_nome).to eq 'REDE DE CONVENIOS DO BRASIL   '
    end
  end

  it 'deve carregar arquivo de retorno do ITAU' do
    arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file('./spec/fixtures/retorno/SB23112AIT.RET')[0]

    expect(arquivo_read.lotes.length).to be 1

    arquivo_read.lotes.each_with_index do |lote_read, _i|
      expect(lote_read.header.empresa_nome).to eq 'REDE DE CONVENIOS DO BRASIL   '
    end
  end
end
