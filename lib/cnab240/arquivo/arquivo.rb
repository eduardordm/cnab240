module Cnab240::Arquivo
  class Arquivo

    attr_accessor :header
    attr_accessor :lotes
    attr_accessor :trailer
    attr_accessor :versao

    def initialize(versao = "V86")
      @versao = versao
      @header = eval("Cnab240::#{versao}::Arquivo::Header").new
      @trailer = eval("Cnab240::#{versao}::Arquivo::Trailer").new
      @lotes = []
    end

    def linhas
      self.auto_fill if Cnab240.auto_fill_enabled
      a = []
      a << @header.linha
      @lotes.each do |lote|
        lote.linhas.each do |linha|
          a << linha
        end
      end
      a << @trailer.linha
      a
    end

    def <<(lote)
      lote.arquivo = self
      @lotes << lote
    end

    def string
      linhas.join("\r\n") << "\r\n"
    end
    
    # Writes +Cnab240::Arquivo::Arquivo+ contents into a +File+, overwriting its current contents.
    #
    # @example Save contents to a file.
    #   Cnab240::Arquivo::Arquivo.new.save_to_file('/tmp/cnab240.txt')
    #
    # @param [ String ] filename The file name to which the contents will be saved to.
    #
    # @return [ Integer ] The number of bytes written to the file.
    #
    # @since 0.0.20
    def save_to_file(filename)
      File.open(filename, 'w').write(string)
    end
    
    # Loads contents from a +File+ into +Cnab240::Arquivo::Arquivo+ instances.
    #
    # @example Load contents from a file.
    #   Cnab240::Arquivo::Arquivo.load_from_file('/tmp/cnab240.txt')
    #
    # @param [ String ] filename The file name from which the contents will be read.
    #
    # @return [ Array<Cnab240::Arquivo::Arquivo> ] A list of +Cnab240::Arquivo::Arquivo+ instances representing the contents read.
    #
    # @since 0.0.20
    def self.load_from_file(filename)
      load(File.open(filename, 'r'))
    end

    # Loads contents from an object that implements the +IO+ interface into +Cnab240::Arquivo::Arquivo+ instances.
    #
    # @example Load contents from a file.
    #   Cnab240::Arquivo::Arquivo.load_from_file(File.open('/tmp/cnab240.txt', 'r'))
    #
    # @param [ IO ] file The I/O interface from which the contents will be read.
    #
    # @return [ Array<Cnab240::Arquivo::Arquivo> ] A list of +Cnab240::Arquivo::Arquivo+ instances representing the contents read.
    #
    # @since 0.0.20
    def self.load(io)
      Cnab240::Builder.new(io).arquivos
    end

    def auto_fill
      trailer.totais_qtde_lotes = lotes.length.to_s
      qtd_registros = lotes.length * 2 # header e trailer de cada lote
      lotes.each { |l| qtd_registros += l.segmentos.length } # segmentos
      qtd_registros += 2 # header e trailer de arquivo
      trailer.totais_qtde_registros = qtd_registros.to_s
    end

  end

end