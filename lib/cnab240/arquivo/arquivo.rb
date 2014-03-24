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

    def save_to_file(filename)
      begin
        File.delete(filename) # LoL
      rescue
      end
      File.open(filename, 'w') { |f| f.write(string) }
    end

    def self.load_from_file(filename)
      Cnab240::Builder.new(filename).arquivos
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