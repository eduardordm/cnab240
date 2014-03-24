require 'spec_helper'

include Cnab240

describe PagamentoItau do

  it "deve criar pagamento" do
    pagamento = PagamentoItau.new({
      :empresa_tipo => '2',
      :empresa_convenio => '1234',
      :empresa_tipo => '2',
      :empresa_numero => '01234567891234',
      :empresa_nome => 'EMPRESA FULANA',
      :empresa_agencia_codigo => '',
      :empresa_conta_numero => '',
      :empresa_agencia_conta_dv => '',
      :arquivo_sequencia => '1',

      :endereco_logradouro => 'AV BRASIL',
      :endereco_numero => '123',
      :endereco_cidade => 'RIO DE JANEIRO',
      :endereco_cep => '12123412',
      :endereco_estado => 'RJ',
      :servico_tipo => '98', # pagamentos - diversos
      :servico_forma => '03', # doc, ted, etc
    })

    pagamento << {:favorecido_banco => '001',
      :favorecido_agencia => '2290',
      :favorecido_conta => '335959',
      :credito_seu_numero => '1234',
      :credito_data_pagamento => '31122012',
      :credito_valor_pagamento => '100',
      :numero_inscricao => '12312312312312',
      :favorecido_nome => 'EMPRESA X',
      :credito_seu_numero => '1234',
      :credito_data_pagamento => '30122012',
      :credito_valor_pagamento => '100'
    }

    pagamento << {:favorecido_banco => '001',
      :favorecido_agencia => '2290',
      :favorecido_conta => '335959',
      :credito_seu_numero => '1234',
      :credito_data_pagamento => '31122012',
      :credito_valor_pagamento => '100',
      :numero_inscricao => '12312312312312',
      :favorecido_nome => 'EMPRESA X',
      :credito_seu_numero => '1234',
      :credito_data_pagamento => '30122012',
      :credito_valor_pagamento => '100'
    }

    pagamento.add_lote({:servico_tipo => '98', # pagamentos - diversos
      :servico_forma => '03' # doc, ted, et
    })

    pagamento << {:favorecido_banco => '001',
      :favorecido_agencia => '2290',
      :favorecido_conta => '335959',
      :credito_seu_numero => '1234',
      :credito_data_pagamento => '31122012',
      :credito_valor_pagamento => '100',
      :numero_inscricao => '12312312312312',
      :favorecido_nome => 'EMPRESA X',
      :credito_seu_numero => '1234',
      :credito_data_pagamento => '30122012',
      :credito_valor_pagamento => '100'
    }

    pagamento.arquivo.header.banco_nome.strip.should eq 'BANCO ITAU'

    pagamento.save_to_file("spec/tmp/arquivo_itau.test")

    pagamento.string
  end
end