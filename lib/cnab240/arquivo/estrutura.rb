module Cnab240

	ESTRUTURA = {
		:pagamento => {
			:header => Cnab240::Pagamentos::Header,
			:trailer => Cnab240::Pagamentos::Trailer,
			:segmentos => [:a, :b, :c],
			:a => {
				:remessa => true,
				:retorno => true
			},
			:b => {
				:remessa => true,
				:retorno => true
			},
			:c => {
				:remessa => false,
				:retorno => false
			}
		},

		:pagamento_titulo_cobranca => {
			:header => Cnab240::PagamentosTitulos::Header,
			:trailer => Cnab240::PagamentosTitulos::Trailer,
			:segmentos => [:j, :j52],
			:j => {
				:remessa => true,
				:retorno => true
			},
			:j52 => {
				:remessa => false,
				:retorno => false
			}
		},

		:pagamento_titulo_tributos => {
			:header => Cnab240::PagamentosTributos::Header,
			:trailer => Cnab240::PagamentosTributos::Trailer,
			:segmentos => [:o, :n, :w, :z],
			:o => {
				:remessa => true,
				:retorno => true
			},
			:n => {
				:remessa => true,
				:retorno => true
			},
			:w => {
				:remessa => false,
				:retorno => false
			},
			:z => {
				:remessa => false,
				:retorno => false
			}
		}

	}
	
end