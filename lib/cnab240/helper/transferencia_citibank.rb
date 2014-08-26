module Cnab240
  class TransferenciaCitibank < Helper

    def initialize(campos = {})
      campos[:controle_banco] ||= '745'
      campos[:banco_nome] ||= 'BANCO CITIBANK S/A'
      campos[:empresa_tipo] ||= '2'
      campos[:arquivo_data_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%d%m%Y')
      campos[:arquivo_hora_geracao] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%H%M%S')
      campos[:arquivo_codigo] ||= '1'

      @arquivo = Cnab240::Arquivo::Arquivo.new('V60')

      fill campos, arquivo.header, arquivo.trailer
    end

    def add_lote(campos = {})
      @arquivo.lotes << lote = Cnab240::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V60')

      campos[:controle_banco] ||= '745'
      campos[:servico_operacao] ||= 'C'
      campos[:controle_lote] = (@arquivo.lotes.length).to_s

      fill campos, lote.header, lote.trailer
    end

    def <<(campos)
      lote = @arquivo.lotes.last

      campos[:controle_banco] ||= '745'
      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length+1).to_s
      # 000 para inclusao e 999 para exclusao
      campos[:servico_tipo_movimento] ||= '000'
      campos[:credito_moeda_tipo] ||= 'BRL'
      # [018] TED (STR,CIP) ou [700] DOC.
      campos[:favorecido_camara] = favorecido_camara(lote, campos)

      segmento_a = Cnab240::V60::SegmentoA.new
      fill campos, segmento_a
      lote << segmento_a

      campos[:controle_lote] = @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] = (lote.segmentos.length+1).to_s
      campos[:pagamento_data_vencimento] ||= (Time.respond_to?(:current) ? Time.current : Time.now).strftime('%d%m%Y')

      segmento_b = Cnab240::V60::SegmentoB.new
      fill campos, segmento_b
      lote << segmento_b
    end

    # [018] TED (STR,CIP) ou [700] DOC (COMPE)
    def favorecido_camara(lote, campos)
      lote.header[:servico_forma] == '01' ? '000' : (campos[:credito_valor_pagamento].to_i < 749) ? '700' : '018'
    end

  end
end