require 'spec_helper'

include Cnab240::Pagamentos
include Cnab240::Arquivo

describe Arquivo do

	it "deve instanciar" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		arquivo.should be_an_instance_of(Cnab240::Arquivo::Arquivo)
	end

	it "deve aceitar lotes" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		arquivo.should respond_to(:lotes)

		(1..10).each do |n|
			lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
			lote.should be_an_instance_of(Cnab240::Lote)
			arquivo.lotes << lote
			arquivo.lotes.length.should be(n)
		end
	end

	it "deve manter 240 em todo o arquivo" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		arquivo.should respond_to(:lotes)

		(1..10).each do |n|
			lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
			lote.should be_an_instance_of(Cnab240::Lote)
			arquivo.lotes << lote
		end

		arquivo.linhas do |linha|
			linha.length.should be(240)
		end
	end

	it "deve ler e escrever em arquivo" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		(1..10).each do |n|
			arquivo.lotes  << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		end
		arquivo.save_to_file("spec/tmp/arquivo.test")
		arquivo = Cnab240::Arquivo::Arquivo.load_from_file("spec/tmp/arquivo.test")
	end

end