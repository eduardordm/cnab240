require "cnab240/version"

require 'bindata'

require "cnab240/ext/attribute_accessors"
require "cnab240/ext/bindata"
require "cnab240/ext/default_mixin"

require "cnab240/arquivo/lote"

require "cnab240/segmentos/segmento_a"
require "cnab240/segmentos/segmento_b"
require "cnab240/segmentos/segmento_c"
require "cnab240/segmentos/segmento_j"
require "cnab240/segmentos/segmento_j52"
require "cnab240/segmentos/segmento_o"
require "cnab240/segmentos/segmento_n"
require "cnab240/segmentos/segmento_w1"
require "cnab240/segmentos/segmento_w"
require "cnab240/segmentos/segmento_z"

require "cnab240/arquivo/arquivo"
require "cnab240/arquivo/header"
require "cnab240/arquivo/trailer"

require "cnab240/pagamentos/header"
require "cnab240/pagamentos/trailer"
require "cnab240/pagamentos/titulos/header"
require "cnab240/pagamentos/titulos/trailer"
require "cnab240/pagamentos/tributos/header"
require "cnab240/pagamentos/tributos/trailer"

require "cnab240/arquivo/estrutura"


module Cnab240

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



