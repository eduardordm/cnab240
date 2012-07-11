require 'spec_helper'

describe Cnab240 do

	it "deve ter campos de configuracao" do
		Cnab240.setup do |config|
			config.should respond_to(:defaults)
			defaults[:empresa_tipo] = "1"
		end
		Cnab240.defaults[:empresa_tipo].should eq("1")
	end

	it "configuracao deve ter efeito" do
		Cnab240.setup do |config|
			defaults[:empresa_tipo] = "1"
		end
		Cnab240.defaults[:empresa_tipo].should eq("1")
		arquivo = Cnab240::Arquivo::Arquivo.new
		arquivo.header.empresa_tipo.should eq("1")
	end
	
end