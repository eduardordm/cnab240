module Cnab240::Pagamentos
	class Header < BinData::Record
		
		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3
		string :controle_lote, :length => 4
		string :controle_registro, :length => 1, :initial_value => '1'

		string :servico_operacao, :value => 'C'
		string :servico_tipo, :length => 2 
		string :servico_forma, :length => 2
		string :servico_layout, :value => '044'

		string :cnab_g004_1, :length => 1

		string :empresa_tipo, :length => 1
		string :empresa_numero, :length => 14 
		string :empresa_convenio, :length => 20
		string :empresa_agencia_codigo, :length => 5
		string :empresa_agencia_dv, :length => 1
		string :empresa_conta_numero, :length => 12
		string :empresa_conta_dv, :length => 1
		string :empresa_agencia_conta_dv, :length => 1 
		string :empresa_nome, :length => 30

		string :informacao_1, :length => 40

		string :endereco_logradouro, :length => 30
		string :endereco_numero, :length => 5
		string :endereco_complemento, :length => 15
		string :endereco_cidade, :length => 20
		string :endereco_cep, :length => 5
		string :endereco_complemento_cep, :length => 3
		string :endereco_estado, :length => 2

		string :indicativo_forma_pagamento, :length => 2
		string :cnab_g004_2, :length => 6
		string :ocorrencias, :length => 10

		private 
		
		def auto_fill
			
		end
	end
end