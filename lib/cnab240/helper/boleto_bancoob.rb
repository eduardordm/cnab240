module Cnab240
  class BoletoSicoob < Helper
    def initialize(campos = {})
      campos[:controle_banco] ||= '756'
      campos[:banco_nome] ||= 'BANCO COOPERATIVO DO BRASIL S/A.'
      campos[:empresa_tipo] ||= '2'
      campos[:arquivo_data_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%d%m%Y')
      campos[:arquivo_hora_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%H%M%S')
      campos[:arquivo_codigo] ||= '1'

      @arquivo = Cnab240::Arquivo::Arquivo.new('V81')

      fill campos, arquivo.header, arquivo.trailer
    end

    def add_lote(campos = {})
      @arquivo.lotes << lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')

      campos[:controle_banco] ||= '756'
      campos[:controle_lote] = (@arquivo.lotes.length).to_s

      fill campos, lote.header, lote.trailer
    end

    def <<(campos)
      lote = @arquivo.lotes.last

      campos[:controle_banco] ||= '756'
      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length + 1).to_s
      # 01 - Entrada de títulos
      campos[:servico_codigo_movimento] ||= '01'

      segmento_p = Cnab240::V81::SegmentoP.new
      fill campos, segmento_p
      lote << segmento_p

      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length + 1).to_s

      segmento_q = Cnab240::V81::SegmentoQ.new
      fill campos, segmento_q
      lote << segmento_q

      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length + 1).to_s

      segmento_r = Cnab240::V81::SegmentoR.new
      fill campos, segmento_r
      lote << segmento_r

      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length + 1).to_s

      segmento_s = Cnab240::V81::SegmentoS.new
      fill campos, segmento_s
      lote << segmento_s
    end
  end
end
