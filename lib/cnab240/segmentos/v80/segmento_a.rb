module Cnab240::V80
	class SegmentoA < BinData::Record

		include Cnab240::DefaultMixin
		include Cnab240::SegmentoMixin
		
		lstring :controle_banco, :length => 3, :pad_byte => '0' 
		lstring :controle_lote, :length => 4, :pad_byte => '0'
		string :controle_registro, :length => 1, :initial_value => '3', :pad_byte => '0'

		lstring :servico_numero_registro, :length => 5, :pad_byte => '0'
		string :servico_codigo_segmento, :length => 1, :initial_value => 'A', :pad_byte => ' '
		lstring :servico_tipo_movimento, :length => 3, :pad_byte => '0'
		lstring :zeros_1, :length => 3, :pad_byte => '0'

		lstring :favorecido_banco, :length => 3, :pad_byte => '0'
		
		choice :favorecido_agencia_conta, :selection => :get_favorecido_agencia_conta do
			string 0, :length => 20, :pad_byte => ' '
            agencia_itau 1
            agencia_outros 2
    	end 

		string :favorecido_nome, :length => 30, :pad_byte => ' '
		string :credito_seu_numero, :length => 20, :pad_byte => ' '
		lstring :credito_data_pagamento, :length => 8, :pad_byte => '0'


		string :credito_moeda_tipo, :length => 3, :pad_byte => ' '

		lstring :zeros_2, :length => 15, :pad_byte => '0'
		lstring :zeros_3, :length => 6, :pad_byte => '0' # Numero do Documento
		lstring :credito_valor_pagamento, :length => 15, :pad_byte => '0'
		string :credito_nosso_numero, :length => 15, :pad_byte => ' '
		string :brancos_1, :length => 5, :pad_byte => ' '

		lstring :credito_data_real, :length => 8, :pad_byte => '0'
		lstring :credito_valor_real, :length => 15, :pad_byte => '0'

		string :finalidade_detalhe, :length => 18, :pad_byte => ' '
		string :brancos_2, :length => 2, :pad_byte => ' '

		string :numero_documento, :length => 6, :pad_byte => ' '
		string :numero_inscricao, :length => 14, :pad_byte => ' '
		string :codigo_finalidade_complementar, :length => 2, :pad_byte => ' '
		string :finalidade_ted, :length => 5, :pad_byte => ' '
		string :brancos_3, :length => 5, :pad_byte => ' '
		lstring :aviso, :length => 1, :pad_byte => ' '
		string :ocorrencias, :length => 10, :pad_byte => ' '


		def get_favorecido_agencia_conta
			case favorecido_banco
			when '341'
				return 1
			when '409'
				return 1
			else
				return 2
			end
		end

	end
end