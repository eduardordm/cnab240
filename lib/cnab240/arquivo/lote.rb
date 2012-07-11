module Cnab240
	class Lote 
		attr_accessor :header
		attr_accessor :segmentos
		attr_accessor :trailer
		attr_accessor :operacao

		def initialize(op = nil)
			@segmentos = {}

			unless @operacao = op
				return
			end
		
			estrutura = ESTRUTURA[operacao]

			@header = estrutura[:header].new
			@trailer = estrutura[:trailer].new

			estrutura[:segmentos].each do |s|
				self << s
			end
		end

		def <<(s)
			segmentos[s] = eval("Segmento#{s.to_s.upcase}.new")
			add_segmento_accessors(s)
		end

		def linhas
			seg_array = Array.new
			estrutura = ESTRUTURA[operacao]
			estrutura[:segmentos].each do |s|
				seg_array << @segmentos[s].linha
			end
			seg_array
		end

		def string
			linhas.join("\n")
		end

		private 

		def add_segmento_accessors(segmento)
			instance_eval <<-RUBY, __FILE__, __LINE__ + 1
				def segmento_#{segmento.to_s.downcase} 
	        		segmentos[:#{segmento}]
	      		end
	      		def segmento_#{segmento.to_s.downcase}=(s)
	        		segmentos[:#{segmento}] = s
	      		end
      		RUBY
		end

	end
end