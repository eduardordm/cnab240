require "cnab240/version"

require 'bindata'

require "cnab240/core_ext/attribute_accessors"
require "cnab240/core_ext/bindata"
require "cnab240/core_ext/default_mixin"

require "cnab240/arquivo/lote"

require "cnab240/segmentos/segmento_a"
require "cnab240/segmentos/segmento_b"
require "cnab240/segmentos/segmento_c"

require "cnab240/arquivo/arquivo"
require "cnab240/arquivo/header"
require "cnab240/arquivo/trailer"

require "cnab240/pagamentos/header"
require "cnab240/pagamentos/trailer"


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
			:header => Cnab240::Pagamentos::Header,
			:trailer => Cnab240::Pagamentos::Trailer,
			:segmentos => [:j, :j52]	
		},

		:pagamento_titulo_cobranca => {
			:header => Cnab240::Pagamentos::Header,
			:trailer => Cnab240::Pagamentos::Trailer,
			:segmentos => [:o, :n, :w, :z]	
		}

	}

	mod_attr_accessor :defaults
	@@defaults = {}


	# Yield self for configuration block:
	#
	#   Cnab240.setup do |config|
	#     config.banco = "001"
	#   end
	#
	def self.setup
		yield self
	end

end



