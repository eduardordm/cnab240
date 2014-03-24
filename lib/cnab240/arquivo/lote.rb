module Cnab240
  class Lote

    attr_accessor :header
    attr_accessor :segmentos
    attr_accessor :trailer
    attr_accessor :operacao
    attr_accessor :tipo
    attr_accessor :arquivo

    def initialize(options = {})
      @segmentos = []

      @operacao ||= options[:operacao]
      @tipo ||= options[:tipo]
      @versao ||= options[:versao]
      @fallback ||= options[:fallback]
      @versao ||= 'V86'

      raise "Operacao nao suportada: #{operacao}" if ESTRUTURA[@versao][operacao].nil?

      estrutura = ESTRUTURA[@versao][operacao]

      @header = estrutura[:header].new
      @trailer = estrutura[:trailer].new

      yield self if block_given?
    end

    def read_segmento(s, line)
      versao = arquivo.versao unless arquivo.nil?
      versao ||= @versao
      segmentos << seg = eval("Cnab240::#{versao}::Segmento#{s.to_s.upcase}.read(line)")
    end

    def <<(s)
      versao = arquivo.versao unless arquivo.nil?
      versao ||= @versao
      case s
        when Symbol, String
          segmentos << seg = eval("Cnab240::#{versao}::Segmento#{s.to_s.upcase}.new")
        else
          segmentos << seg = s
      end
      seg.lote = self
      seg
    end

    def linhas
      self.auto_fill if Cnab240.auto_fill_enabled
      seg_array = []
      seg_array << @header.linha
      segmentos.each do |s|
        seg_array << s.linha
      end
      seg_array << @trailer.linha
      seg_array
    end

    def string
      linhas.join("\r\n")
    end

    def auto_fill
      # totais_qtde_registros

    end

  end
end