# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Cnab240::Arquivo::Arquivo do

  it "deve instanciar" do
    expect(subject).to be_an_instance_of(described_class)
  end

  it "deve aceitar lotes" do
    expect(subject).to respond_to(:lotes)

    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
      expect(subject.lotes.length).to be(n)
    end
  end

  it "deve manter 240 em todo o arquivo" do
    expect(subject).to respond_to(:lotes)

    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    end

    subject.linhas do |linha|
      expect(linha.length).to be(240)
    end
  end

  it "deve ler e escrever, mantendo classe de lote" do
    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    end
    # Simulando escrita em arquivo
    io = StringIO.new("", "w+")
    io.write(subject.string)
    # Rebobinando arquivo escrito para leitura
    io.rewind

    arquivo_read = described_class.load(io)[0]

    expect(arquivo_read.lotes.length).to be 10

    arquivo_read.lotes.each_with_index do |lote_read, i|
      expect(lote_read.header.servico_operacao).to eq subject.lotes[i].header.servico_operacao
      expect(lote_read).to be_an_instance_of(subject.lotes[i].class)
      expect(lote_read.segmentos.length).to be subject.lotes[i].segmentos.length
    end
  end

  it "arquivos devem ser identicos" do
    (1..10).each do |n|
      subject << Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
    end
    # Simulando escrita em arquivo
    io = StringIO.new("", "w+")
    io.write(subject.string)
    # Rebobinando arquivo escrito para leitura
    io.rewind

    arquivo_read = described_class.load(io)[0]

    expect(arquivo_read.header.linha).to eq subject.header.linha
    expect(arquivo_read.trailer.linha).to eq subject.trailer.linha
  end

  it "auto fill do arquivo - soma de registros" do
    (1..2).each do |n|
      subject << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa)
      lote << :a
    end
    subject.auto_fill
    expect(subject.trailer.totais_qtde_lotes).to eq '000002'
    expect(subject.trailer.totais_qtde_registros).to eq '000008'
  end

  xit "deve carregar arquivo grande" do
    pending("Falta escrever esse teste, provavelmente gerando um arquivo grande em memória")
    #	arquivo_read = Cnab240::Arquivo::Arquivo.load_from_file("spec/fixtures/B330002984PSL.REM")[0]
    #		arquivo_read.save_to_file("spec/fixtures/arquivo.test")
    #		arquivo_read2 = Cnab240::Arquivo::Arquivo.load_from_file("spec/fixtures/arquivo.test")[0]
    #		arquivo_read.string.should eq arquivo_read2.string
  end
end