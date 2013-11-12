require "cnab240/version"

require 'bindata'


require "cnab240/ext/attribute_accessors"
require "cnab240/ext/bindata"
require "cnab240/ext/lstring"
require "cnab240/ext/default_mixin"
require "cnab240/ext/segmento_mixin"
require "cnab240/ext/filler"

require "cnab240/arquivo/lote"

require "cnab240/segmentos/v86/segmento_a"
require "cnab240/segmentos/v86/segmento_b"
require "cnab240/segmentos/v86/segmento_c"
require "cnab240/segmentos/v86/segmento_j"
require "cnab240/segmentos/v86/segmento_j52"
require "cnab240/segmentos/v86/segmento_o"
require "cnab240/segmentos/v86/segmento_n8"
require "cnab240/segmentos/v86/segmento_n7"
require "cnab240/segmentos/v86/segmento_n6"
require "cnab240/segmentos/v86/segmento_n5"
require "cnab240/segmentos/v86/segmento_n4"
require "cnab240/segmentos/v86/segmento_n3"
require "cnab240/segmentos/v86/segmento_n2"
require "cnab240/segmentos/v86/segmento_n1"
require "cnab240/segmentos/v86/segmento_n"
require "cnab240/segmentos/v86/segmento_w1"
require "cnab240/segmentos/v86/segmento_w"
require "cnab240/segmentos/v86/segmento_z"

require "cnab240/segmentos/v80/agencia_itau"
require "cnab240/segmentos/v80/agencia_outros"
require "cnab240/segmentos/v40/segmento_a"
require "cnab240/segmentos/v80/segmento_a"

require "cnab240/arquivo/arquivo"

require "cnab240/arquivo/v80/header"
require "cnab240/arquivo/v80/trailer"
require "cnab240/arquivo/v86/header"
require "cnab240/arquivo/v86/trailer"
require "cnab240/arquivo/v40/header"
require "cnab240/arquivo/v40/trailer"


require "cnab240/pagamentos/v80/header"
require "cnab240/pagamentos/v80/trailer"
require "cnab240/pagamentos/v86/header"
require "cnab240/pagamentos/v86/trailer"
require "cnab240/pagamentos/v86/titulos/header"
require "cnab240/pagamentos/v86/titulos/trailer"
require "cnab240/pagamentos/v86/tributos/header"
require "cnab240/pagamentos/v86/tributos/trailer"

require "cnab240/pagamentos/v40/header"
require "cnab240/pagamentos/v40/trailer"

require "cnab240/arquivo/estrutura"
require "cnab240/arquivo/builder"

require "cnab240/helper/pagamento_itau"
require "cnab240/helper/pagamento_bradesco"

module Cnab240

	mod_attr_accessor :defaults
	@@defaults = {}

	mod_attr_accessor :fallback
	@@fallback = "V86"

	mod_attr_accessor :auto_fill_enabled
	@@auto_fill_enabled = true

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



