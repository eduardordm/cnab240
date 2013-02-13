require 'spec_helper'

include Cnab240::V86::Pagamentos
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
			arquivo << lote
			arquivo.lotes.length.should be(n)
		end
	end

	it "deve manter 240 em todo o arquivo" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		arquivo.should respond_to(:lotes)

		(1..10).each do |n|
			lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
			lote.should be_an_instance_of(Cnab240::Lote)
			arquivo << lote
		end

		arquivo.linhas do |linha|
			linha.length.should be(240)
		end
	end

	it "deve ler e escrever, mantendo classe de lote" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		(1..10).each do |n|
			arquivo  << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		end
		arquivo.save_to_file("spec/tmp/arquivo.test")

		arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("spec/tmp/arquivo.test")[0]

		arquivo_read.lotes.length.should be 10

		arquivo_read.lotes.each_with_index do |lote_read, i| 
			lote_read.header.servico_operacao.should eq arquivo.lotes[i].header.servico_operacao
			lote_read.should be_an_instance_of(arquivo.lotes[i].class)
			lote_read.segmentos.length.should be arquivo.lotes[i].segmentos.length
		end
	end

	it "arquivos devem ser identicos" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		(1..10).each do |n|
			arquivo << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
		end
		arquivo.save_to_file("spec/tmp/arquivo.test")

		arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("./spec/tmp/arquivo.test")[0]
		
		header_r = arquivo_read.header
		header = arquivo.header

		arquivo_read.header.linha.should eq arquivo.header.linha
		arquivo_read.trailer.linha.should eq arquivo.trailer.linha

	end

	it "auto fill do arquivo - soma de registros" do
		arquivo = Cnab240::Arquivo::Arquivo.new
		(1..2).each do |n|
			arquivo << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
			lote << :a
		end
		arquivo.auto_fill
		arquivo.trailer.totais_qtde_lotes.should eq '000002'
		arquivo.trailer.totais_qtde_registros.should eq '000008'
	end

	it "deve carregar arquivo grande" do

	#	arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("spec/tmp/B330002984PSL.REM")[0]
#		arquivo_read.save_to_file("spec/tmp/arquivo.test")
#		arquivo_read2 = Cnab240::Arquivo::Arquivo.load_from_file("spec/tmp/arquivo.test")[0]
#		arquivo_read.string.should eq arquivo_read2.string
	end


end