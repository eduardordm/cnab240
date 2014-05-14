# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Cnab240::Arquivo::Arquivo do

  it "deve instanciar" do
    subject.should be_an_instance_of(described_class)
  end

  it "deve aceitar lotes" do
    subject.should respond_to(:lotes)

    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
      subject.lotes.length.should be(n)
    end
  end

  it "deve manter 240 em todo o arquivo" do
    subject.should respond_to(:lotes)

    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    end

    subject.linhas do |linha|
      linha.length.should be(240)
    end
  end

  it "deve ler e escrever, mantendo classe de lote" do
    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    end
    # Simulando escrita em arquivo
    file = StringIO.new("", "w+")
    subject.save_to_file(file)
    # Rebobinando arquivo escrito para leitura
    file.rewind

    arquivo_read = described_class.load_from_file(file)[0]

    arquivo_read.lotes.length.should be 10

    arquivo_read.lotes.each_with_index do |lote_read, i|
      lote_read.header.servico_operacao.should eq subject.lotes[i].header.servico_operacao
      lote_read.should be_an_instance_of(subject.lotes[i].class)
      lote_read.segmentos.length.should be subject.lotes[i].segmentos.length
    end
  end

  it "arquivos devem ser identicos" do
    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    end
    # Simulando escrita em arquivo
    file = StringIO.new("", "w+")
    subject.save_to_file(file)
    # Rebobinando arquivo escrito para leitura
    file.rewind

    arquivo_read = described_class.load_from_file(file)[0]

    arquivo_read.header.linha.should eq subject.header.linha
    arquivo_read.trailer.linha.should eq subject.trailer.linha
  end

  it "auto fill do arquivo - soma de registros" do
    (1..2).each do |n|
      subject << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
      lote << :a
    end
    subject.auto_fill
    subject.trailer.totais_qtde_lotes.should eq '000002'
    subject.trailer.totais_qtde_registros.should eq '000008'
  end

  it "deve carregar arquivo grande" do
    pending("Falta escrever esse teste, provavelmente gerando um arquivo grande em memória")
    #	arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("spec/fixtures/B330002984PSL.REM")[0]
    #		arquivo_read.save_to_file("spec/fixtures/arquivo.test")
    #		arquivo_read2 = Cnab240::Arquivo::Arquivo.load_from_file("spec/fixtures/arquivo.test")[0]
    #		arquivo_read.string.should eq arquivo_read2.string
  end
end