module Cnab240
  class TransferenciaSicoob < Helper
    def initialize(campos = {})
      campos[:controle_banco] ||= '756'
      campos[:banco_nome] ||= 'BANCO COOPERATIVO DO BRASIL S.A.'
      campos[:empresa_tipo] ||= '2'
      campos[:arquivo_data_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%d%m%Y')
      campos[:arquivo_hora_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%H%M%S')
      campos[:arquivo_codigo] ||= '1'
      campos[:versao] ||= 'V87'

      @arquivo = Cnab240::Arquivo::Arquivo.new(campos[:versao])

      fill campos, arquivo.header, arquivo.trailer
    end

    def add_lote(campos = {})
      campos[:versao] ||= 'V87'

      @arquivo.lotes << lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: campos[:versao])

      campos[:controle_banco] ||= '756'
      campos[:servico_operacao] ||= 'C'
      campos[:controle_lote] = (@arquivo.lotes.length).to_s

      fill campos, lote.header, lote.trailer
    end

    def <<(campos)
      lote = @arquivo.lotes.last

      campos[:controle_banco] ||= '756'
      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length + 1).to_s
      # 000 para inclusao e 999 para exclusao
      campos[:servico_tipo_movimento] ||= '000'
      campos[:credito_moeda_tipo] ||= 'BRL'

      campos[:versao] ||= 'V87'

      segmento_a = Cnab240::V87::SegmentoA.new
      fill campos, segmento_a
      lote << segmento_a

      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length + 1).to_s

      segmento_b = Cnab240.const_get(campos[:versao])::SegmentoB.new
      fill campos, segmento_b
      lote << segmento_b
    end
  end
end
