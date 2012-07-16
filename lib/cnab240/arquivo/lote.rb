module Cnab240
	class Lote 
		attr_accessor :header
		attr_accessor :segmentos
		attr_accessor :trailer
		attr_accessor :operacao
		attr_accessor :tipo

		def initialize(options = {})
			@segmentos = {}
			
			@operacao ||= options[:operacao]
			@tipo ||= options[:tipo]

			raise "Operacao nao suportada: #{operacao}" if ESTRUTURA[operacao].nil?

			estrutura = ESTRUTURA[operacao]

			@header = estrutura[:header].new
			@trailer = estrutura[:trailer].new

			yield self if block_given?

			estrutura[:segmentos].each do |s|
				raise "Tipo nao suportado: [#{s}][#{tipo}]" if estrutura[s][tipo].nil?
				if estrutura[s][tipo] == true
					self << s 
				end
			end
		end

		def <<(s)
			segmentos[s] = eval("Segmento#{s.to_s.upcase}.new")
			segmentos[s].lote = self
			add_segmento_accessors(s)
		end

		def linhas
			seg_array = Array.new
			estrutura = ESTRUTURA[operacao]
			seg_array << @header.linha
			estrutura[:segmentos].each do |s|
				seg_array << @segmentos[s].linha unless @segmentos[s].nil?
			end
			seg_array << @trailer.linha
			seg_array
		end

		def string
			linhas.join("\n")
		end

		private 

		def add_segmento_accessors(segmento)
			instance_eval <<-RUBY, __FILE__, __LINE__ + 1
				def segmento_#{segmento.to_s.downcase} 
	        		segmentos[:#{segmento.to_s.downcase}] 
	      		end
	      		def segmento_#{segmento.to_s.downcase}=(s)
	        		segmentos[:#{segmento.to_s.downcase}] = s
	      		end
      		RUBY
		end

	end
end