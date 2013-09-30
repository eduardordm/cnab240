module BinData
	class Record < BinData::Struct
		def linha # lulz
			self.auto_fill if self.respond_to?(:auto_fill) && Cnab240.auto_fill_enabled
			s = StringIO.new
			self.write(s)
			raise "Invalid line length #{s.string.bytesize}" unless (s.string.bytesize == 240)  || self.respond_to?(:lote)
			s.string
		end
	end
end