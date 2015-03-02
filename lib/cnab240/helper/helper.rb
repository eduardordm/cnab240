module Cnab240
  class Helper
    include Cnab240::Filler

    attr_accessor :arquivo

    def string
      arquivo.string
    end

    def save_to_file(file)
      arquivo.save_to_file(file)
    end
  end
end
