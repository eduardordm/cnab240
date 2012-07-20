require 'spec_helper'

include Cnab240

describe PagamentoItau do

	it "deve criar pagamento" do
		


		pagamento = PagamentoItau.new({ :empresa_tipo => '1',
				:empresa_convenio => '1234',
				:empresa_numero => '0123456789',
				:empresa_nome => 'EMPRESA FULANA',
				:empresa_agencia_codigo => '',
				:empresa_conta_numero => '',
				:empresa_agencia_conta_dv => '',
				:arquivo_sequencia => '1'
		})


		pagamento.add( {


			})

			
	end

end