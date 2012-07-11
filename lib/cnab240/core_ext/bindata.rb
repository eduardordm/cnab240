module BinData
	class Record < BinData::Struct
		def linha # lulz
			s = StringIO.new
			self.write(s)
			s.string
		end
	end
end