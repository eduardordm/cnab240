require 'spec_helper'

include Cnab240

describe PagamentoItau do

	it "deve criar pagamento" do
		
		pagamento = PagamentoItau.new({ 
			# header de arquivo
			:empresa_tipo => '1',
			:empresa_convenio => '1234',
			:empresa_tipo => '2',
			:empresa_numero => '01234567891234',
			:empresa_nome => 'EMPRESA FULANA',
			:empresa_agencia_codigo => '',
			:empresa_conta_numero => '',
			:empresa_agencia_conta_dv => '',
			:arquivo_sequencia => '1'
		})

		pagamento.add({
			# header do lote
			:empresa_tipo => '2', # tipo empresa creditada
			:empresa_numero => '999999999999', # cpf cnpj creditado
			:empresa_convenio => '12345', # convenio junto ao banco
			:empresa_agencia_codigo => '2290', # agencia creditada
			:empresa_conta_numero => '33595', # conta creditada
			:empresa_agencia_conta_dv => '9', # dv conta agencia
			:empresa_nome => 'ZECA URUBU',
			:endereco_logradouro => 'AV BRASIL',
			:endereco_numero => '123',
			:endereco_cidade => 'RIO DE JANEIRO',
			:endereco_cep => '12123412',
			:endereco_estado => 'RJ',
			# segmento a
			:favorecido_agencia_codigo => '1234', # agencia do debitado
			:favorecido_conta_numero => '12345', # conta do debitado
			:favorecido_agencia_conta_dv => '1', # dv agencia e conta
			:favorecido_nome => 'EMPRESA X', # nome do debitado
			:credito_seu_numero => '1234',
			:data => '30122012',
			:valor => '100',
			:numero_inscricao => '12345678901234' # cpf ou cnpj do debitado
		})

			
		pagamento.arquivo.header.banco_nome.strip.should eq 'BANCO ITAU'
	end

end