module Cnab240
	module DefaultMixin

		def initialize_instance
			super
			Cnab240.defaults.each do |k, v|
				if self.respond_to?("#{k}=") 
					self.send("#{k}=", v)
				end
			end 
		end


	end
end