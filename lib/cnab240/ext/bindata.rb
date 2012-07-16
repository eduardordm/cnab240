module BinData
	class Record < BinData::Struct
		def linha # lulz
			self.auto_fill if self.respond_to?(:auto_fill) 
			s = StringIO.new
			self.write(s)
			raise "Invalid line length #{s.string.length}" unless (s.string.length == 240)  || self.respond_to?(:lote)
			s.string
		end
	end
end