# -*- encoding: utf-8 -*-
require 'spec_helper'

include Cnab240

describe PagamentoSicoob do

  it "deve criar pagamento" do

    favorecido = {:favorecido_banco => '001',
      :favorecido_agencia_codigo => '1242',
      :favorecido_agencia_dv => '8',
      :favorecido_conta_numero => '1273',
      :favorecido_conta_dv => '0',
      :credito_seu_numero => '1',
      :credito_data_pagamento => '26032014',
      :credito_valor_pagamento => '102',
      :favorecido_nome => 'KIVANIO BARBOSA',
      :favorecido_inscricao_tipo => '1',
      :favorecido_inscricao_numero => '12323377119'
    }

    beneficiario = {
      :empresa_convenio => '8',
      :empresa_numero => '07813784006126',
      :empresa_nome => 'BALLTEC LTDA',
      :empresa_agencia_codigo => '1327',
      :empresa_agencia_dv => '3',
      :empresa_conta_numero => '3636',
      :empresa_conta_dv => '8',
      :arquivo_sequencia => '1',
      :endereco_logradouro => 'AV BRASIL',
      :endereco_numero => '123',
      :endereco_cidade => 'RIO DE JANEIRO',
      :endereco_cep => '12123412',
      :endereco_estado => 'RJ',
      :servico_tipo => '98', # pagamentos - diversos
      :servico_forma => '03', # doc, ted, etc
    }

    # Cria pagamento já com 1 lote criado
    pagamento = PagamentoSicoob.new(beneficiario)

    # adiciona pagamentos no último lote criado
    pagamento << favorecido # primeiro pagamento
    pagamento << favorecido # segundo pagamento

    # Adiciona segundo lote
    pagamento.add_lote(beneficiario)

    pagamento << favorecido

    pagamento.arquivo.header.banco_nome.strip.should eq 'BANCO COOPERATIVO DO BRASIL S.'

    # Simulando arquivo de escrita
    io = StringIO.new("", "w+")
    io.write(pagamento.string)

    pagamento.string
  end

  it "deve carregar arquivo de retorno do SICOOB" do
    pending("Falta adicionar um exemplo de arquivo de retorno dessa instituição") do
      arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("./spec/fixtures/retorno/SICOOB.RET")[0]

      arquivo_read.lotes.length.should be 2

      arquivo_read.lotes.each_with_index do |lote_read, i|
        expect(lote_read.header.empresa_nome).to eq 'BALLTEC LTDA                  '
      end
    end
  end
end