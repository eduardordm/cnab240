module Cnab240::PagamentosTitulos
	class Header < BinData::Record
		
		include Cnab240::DefaultMixin

		string :controle_banco, :length => 3, :pad_byte => '0'
		string :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '1', :pad_byte => '0'

		string :servico_operacao, :value => 'C', :pad_byte => ' '
		string :servico_tipo, :length => 2 , :pad_byte => '0'
		string :servico_forma, :length => 2, :pad_byte => '0'
		string :servico_layout, :value => '040', :pad_byte => '0'

		string :cnab_g004_1, :length => 1, :pad_byte => ' '

		string :empresa_tipo, :length => 1, :pad_byte => '0'
		string :empresa_numero, :length => 14, :pad_byte => '0'
		string :empresa_convenio, :length => 20, :pad_byte => ' '
		string :empresa_agencia_codigo, :length => 5, :pad_byte => '0'
		string :empresa_agencia_dv, :length => 1, :pad_byte => ' '
		string :empresa_conta_numero, :length => 12, :pad_byte => '0'
		string :empresa_conta_dv, :length => 1, :pad_byte => ' '
		string :empresa_agencia_conta_dv, :length => 1, :pad_byte => ' '
		string :empresa_nome, :length => 30, :pad_byte => ' '

		string :informacao_1, :length => 40, :pad_byte => ' '

		string :endereco_logradouro, :length => 30, :pad_byte => ' '
		string :endereco_numero, :length => 5, :pad_byte => '0'
		string :endereco_complemento, :length => 15, :pad_byte => ' '
		string :endereco_cidade, :length => 20, :pad_byte => ' '
		string :endereco_cep, :length => 5, :pad_byte => '0'
		string :endereco_complemento_cep, :length => 3, :pad_byte => '0'
		string :endereco_estado, :length => 2, :pad_byte => ' '

		string :cnab_g004_2, :length => 8, :pad_byte => ' '
		string :ocorrencias, :length => 10, :pad_byte => ' '

		private 
		
		def auto_fill
			
		end
	end
end