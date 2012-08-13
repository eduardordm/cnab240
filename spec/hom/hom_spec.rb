require 'spec_helper'

include Cnab240

describe "HomSpec" do

	it "teste para envio ao banco Itau: homologacao" do
		
		pagamento = PagamentoItau.new({ 
			:empresa_tipo => '2',
			:empresa_numero => '05946982000122',
			:empresa_nome => 'REDE DE CONVENIOS DO BRASIL',
			:empresa_agencia_codigo => '0663',
			:empresa_conta_numero => '015402',
		#	:empresa_agencia_conta_dv => '',
			:arquivo_sequencia => '1',

			:endereco_logradouro => 'RUA GETULIO VARGAS',
			:endereco_numero => '3646',
			:endereco_cidade => 'PORTO VELHO',
			:endereco_cep => '76000000',
			:endereco_estado => 'RO',
			:servico_tipo => '98', # pagamentos - diversos
			:servico_forma => '41', # doc, ted, etc
		})

		pagamento << { 
			:favorecido_banco => '001',
			:favorecido_agencia => '2290',
			:favorecido_conta => '335959',
			:credito_seu_numero => '1',
			:credito_data_pagamento => '03082012',
			:credito_valor_pagamento => '500000',
			:numero_inscricao => '69375208168',
			:favorecido_nome => 'JOSE EDUARDO MOURAO'
		}

		pagamento.save_to_file("spec/tmp/itau07.rem")
	end

end