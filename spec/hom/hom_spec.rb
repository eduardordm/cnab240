require 'spec_helper'

include Cnab240

describe "HomSpec" do

	it "teste para envio ao banco Itau: homologacao" do
		
		pagamento = PagamentoItau.new({ 
			:empresa_tipo => '2',
			:empresa_numero => '05946982000122',
			:empresa_nome => 'REDE DE CONVENIOS DO BRASIL',
			:empresa_agencia_codigo => '663',
			:empresa_conta_numero => '01540',
			:empresa_agencia_conta_dv => '2',
			:arquivo_sequencia => '1',

			:endereco_logradouro => 'RUA GETULIO VARGAS',
			:endereco_numero => '3646',
			:endereco_cidade => 'PORTO VELHO',
			:endereco_cep => '76000000',
			:endereco_estado => 'RO',
			:servico_tipo => '98', # pagamentos - diversos
			:servico_forma => '41', # doc, ted, etc

			:totais_valor => '600000',
			:totais_qtde_registros => '3'
		})

		pagamento << { 
			:favorecido_banco => '001',
			:favorecido_agencia => '2290',
			:favorecido_conta => '33595',
			:favorecido_agencia_conta_dv => '9',
			:credito_seu_numero => '1',
			:credito_data_pagamento => '03092012',
			:credito_valor_pagamento => '600000',
			:numero_inscricao => '69375208168',
			:favorecido_nome => 'JOSE EDUARDO MOURAO'
		}

		pagamento.save_to_file("./spec/tmp/itau46.rem")
	end

	it "deve carregar arquivo de retorno" do
		arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("./spec/hom/retorno/SB22112AIT.ret")[0]

		arquivo_read.lotes.length.should be 1

		arquivo_read.lotes.each_with_index do |lote_read, i| 
			lote_read.header.empresa_nome.equal? 'REDE DE CONVENIOS DO BRASIL   '
		end


		arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("./spec/hom/retorno/SB23112AIT.ret")[0]

		arquivo_read.lotes.length.should be 1

		arquivo_read.lotes.each_with_index do |lote_read, i| 
			lote_read.header.empresa_nome.equal? 'REDE DE CONVENIOS DO BRASIL   '
		end

	end

end