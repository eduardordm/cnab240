module Cnab240
	class Lote 

		attr_accessor :header
		attr_accessor :segmentos
		attr_accessor :trailer
		attr_accessor :operacao
		attr_accessor :tipo
		attr_accessor :arquivo

		def initialize(options = {})
			@segmentos = {}
			
			@operacao ||= options[:operacao]
			@tipo ||= options[:tipo]
			@versao ||= options[:versao]
			@fallback ||= options[:fallback]
			@versao ||= 'V86'

			raise "Operacao nao suportada: #{operacao}" if ESTRUTURA[@versao][operacao].nil?

			estrutura = ESTRUTURA[@versao][operacao]

			@header = estrutura[:header].new 
			@trailer = estrutura[:trailer].new

			yield self if block_given?

			if tipo != :none
				estrutura[:segmentos].each do |s|
					raise "Tipo nao suportado: [#{s}][#{tipo}]" if (estrutura[s][tipo].nil?) && tipo != :any
					self << s  if (tipo == :any) || (estrutura[s][tipo] == true)
				end
			end
		end

		def read_segmento(s, line)
			segmento = self << s
			segmentos[s] = segmento.read(line)
		end

		def <<(s)
			versao = arquivo.versao unless arquivo.nil?
			versao ||= @versao

			segmentos[s] = eval("Cnab240::#{versao}::Segmento#{s.to_s.upcase}.new")
			segmentos[s].lote = self
			add_segmento_accessors(s)
			segmentos[s]
		end

		def linhas
			seg_array = Array.new
			estrutura = ESTRUTURA[@versao][operacao]
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