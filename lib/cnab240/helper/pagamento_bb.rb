module Cnab240
  class PagamentoBb < Helper
    def initialize(campos = {})
      campos[:controle_banco] ||= '001'
      campos[:banco_nome] ||= 'BANCO DO BRASIL S.A.'
      campos[:empresa_tipo] ||= '2'
      campos[:arquivo_data_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%d%m%Y')
      campos[:arquivo_hora_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%H%M%S')
      campos[:arquivo_codigo] ||= '1'
      campos[:versao] ||= 'V86'

      @arquivo = Cnab240::Arquivo::Arquivo.new(campos[:versao])
      @arquivo.lotes << lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: campos[:versao])

      fill campos, arquivo.header, arquivo.trailer

      campos[:servico_operacao] ||= 'C'
      campos[:controle_lote] ||= '0001'

      fill campos, lote.header, lote.trailer
    end

    def add_lote(campos = {})
      campos[:versao] ||= 'V86'

      @arquivo.lotes << lote = Cnab240::Lote.new(operacao: :pagamento, tipo: :remessa, versao: campos[:versao])

      campos[:servico_operacao] ||= 'C'
      campos[:controle_lote] ||= '0001'

      fill campos, lote.header
    end

    def <<(campos)
      lote = @arquivo.lotes.last

      campos[:controle_banco] ||= '001'
      campos[:controle_lote] ||= @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] ||= (lote.segmentos.length + 1).to_s
      # 000 para inclusao e 999 para exclusao
      campos[:servico_tipo_movimento] ||= '000'
      campos[:credito_moeda_tipo] ||= 'BRL'
      campos[:totais_qtde_registros] ||= (lote.segmentos.length + 2).to_s
      campos[:versao] ||= 'V86'

      segmento_a = Cnab240.const_get(campos[:versao])::SegmentoA.new
      fill campos, segmento_a
      # fill campos, segmento_a.favorecido_agencia_conta

      lote << segmento_a
    end
  end
end
