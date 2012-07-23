module Cnab240
	module Filler

		def fill(hash, *objects)
			objects.each do |object|
				hash.each do |k,v|
					object.send("#{k}=", v) if object.respond_to?("#{k}=")
				end
			end
		end

	end
end