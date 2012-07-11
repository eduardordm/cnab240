module Cnab240::Arquivo
	class Arquivo
		attr_accessor :header
		attr_accessor :lotes
		attr_accessor :trailer

		def initialize
			@header = Header.new
			@trailer = Trailer.new
			@lotes = []
		end


		def linhas
			a = Array.new
			a << @header.linha
			@lotes.each do |lote|
				lote.linhas.each do |linha|
					a << linha
				end
			end 
			a << @trailer.linha
			a
		end

		def string
			a.join("\n")
		end

	end

end