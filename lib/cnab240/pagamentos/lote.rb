module Cnab240::Pagamentos
	class Lote 
		attr_accessor :header
		attr_accessor :segmento_a
		attr_accessor :segmento_b
		attr_accessor :segmento_c
		attr_accessor :trailer

		def initialize
			@header = Header.new
			@segmento_a = SegmentoA.new
			@segmento_b = SegmentoB.new
			@trailer = Trailer.new
		end

		def linhas
			@segmento_c.nil? ? [@header, @segmento_a, @segmento_b, @trailer] : [@header, @segmento_a, @segmento_b, @segmento_c, @trailer]
		end

		def string
			linhas.join("\n")
		end

	end
end