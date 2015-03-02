module BinData
  class Record < BinData::Struct
    def linha # lulz
      auto_fill if self.respond_to?(:auto_fill) && Cnab240.auto_fill_enabled
      s = StringIO.new
      write(s)
      fail "Invalid line length #{s.string.length}" unless (s.string.length == 240) || self.respond_to?(:lote)
      s.string
    end
  end
end
