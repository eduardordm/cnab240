module Cnab240
  module DefaultMixin
    def initialize_instance
      super
      Cnab240.defaults.each do |k, v|
        if self.respond_to?("#{k}=")
          send("#{k}=", v)
        end
      end
      yield self if block_given?
    end
  end
end
