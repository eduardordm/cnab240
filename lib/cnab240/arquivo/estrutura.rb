module Cnab240
  ESTRUTURA_V40 = {
    segmentos_implementados: [:a],
    pagamento: {
      header: Cnab240::V40::Pagamentos::Header,
      trailer: Cnab240::V40::Pagamentos::Trailer,
      segmentos: [:a],
      a: {
        remessa: true,
        retorno: true
      }
    }
  }

  ESTRUTURA_V60 = {
    segmentos_implementados: [:a, :b],
    pagamento: {

      header: Cnab240::V60::Pagamentos::Header,
      trailer: Cnab240::V60::Pagamentos::Trailer,

      segmentos: [:a, :b],
      a: {
        remessa: true,
        retorno: true
      },
      b: {
        remessa: true,
        retorno: true
      }
    }
  }

  ESTRUTURA_V80 = {
    segmentos_implementados: [:a],
    pagamento: {
      header: Cnab240::V80::Pagamentos::Header,
      trailer: Cnab240::V80::Pagamentos::Trailer,
      segmentos: [:a],
      a: {
        remessa: true,
        retorno: true
      }
    }
  }

  ESTRUTURA_V81 = {
    segmentos_implementados: [:p, :q, :r, :s],
    boleto: {

      header: Cnab240::Lote::V40::Boletos::Header,
      trailer: Cnab240::Lote::V40::Boletos::Trailer,

      segmentos: [:p, :q, :r, :s],
      p: {
        remessa: true
      },
      q: {
        remessa: true
      },
      r: {
        remessa: false
      },
      s: {
        remessa: false
      }
    }
  }

  ESTRUTURA_V83 = {
    segmentos_implementados: [:a, :b, :j, :z],
    pagamento: {

      header: Cnab240::V83::Pagamentos::Header,
      trailer: Cnab240::V83::Pagamentos::Trailer,

      segmentos: [:a, :b],
      a: {
        remessa: true,
        retorno: true
      },
      b: {
        remessa: true,
        retorno: true
      }
    }
  }

  ESTRUTURA_V86 = {
    segmentos_implementados: [:a, :b, :c, :j, :j52, :o, :n, :w, :z],
    pagamento: {

      header: Cnab240::V86::Pagamentos::Header,
      trailer: Cnab240::V86::Pagamentos::Trailer,

      segmentos: [:a, :b, :c],
      a: {
        remessa: true,
        retorno: true
      },
      b: {
        remessa: true,
        retorno: true
      },
      c: {
        remessa: false,
        retorno: false
      }
    },

    pagamento_titulo_cobranca: {

      header: Cnab240::V86::PagamentosTitulos::Header,
      trailer: Cnab240::V86::PagamentosTitulos::Trailer,

      segmentos: [:j, :j52],
      j: {
        remessa: true,
        retorno: true
      },
      j52: {
        remessa: false,
        retorno: false
      }
    },

    pagamento_titulo_tributos: {

      header: Cnab240::V86::PagamentosTributos::Header,
      trailer: Cnab240::V86::PagamentosTributos::Trailer,

      segmentos: [:o, :n, :w, :z],
      o: {
        remessa: true,
        retorno: true
      },
      n: {
        remessa: true,
        retorno: true
      },
      w: {
        remessa: false,
        retorno: false
      },
      z: {
        remessa: false,
        retorno: false
      }
    }
  }

  ESTRUTURA_V87 = {
    segmentos_implementados: [:a, :b, :c, :j, :j52, :o, :n, :w, :z],
    pagamento: {

      header: Cnab240::V87::Pagamentos::Header,
      trailer: Cnab240::V87::Pagamentos::Trailer,

      segmentos: [:a, :b, :c],
      a: {
        remessa: true,
        retorno: true
      },
      b: {
        remessa: true,
        retorno: true
      },
      c: {
        remessa: false,
        retorno: false
      }
    },

    pagamento_titulo_cobranca: {

      header: Cnab240::V87::PagamentosTitulos::Header,
      trailer: Cnab240::V87::PagamentosTitulos::Trailer,

      segmentos: [:j, :j52],
      j: {
        remessa: true,
        retorno: true
      },
      j52: {
        remessa: false,
        retorno: false
      }
    },

    pagamento_titulo_tributos: {

      header: Cnab240::V87::PagamentosTributos::Header,
      trailer: Cnab240::V87::PagamentosTributos::Trailer,

      segmentos: [:o, :n, :w, :z],
      o: {
        remessa: true,
        retorno: true
      },
      n: {
        remessa: true,
        retorno: true
      },
      w: {
        remessa: false,
        retorno: false
      },
      z: {
        remessa: false,
        retorno: false
      }
    }
  }

  ESTRUTURA = {
    'V40' => ESTRUTURA_V40,
    'V60' => ESTRUTURA_V60,
    'V80' => ESTRUTURA_V80,
    'V81' => ESTRUTURA_V81,
    'V83' => ESTRUTURA_V83,
    'V86' => ESTRUTURA_V86,
    'V87' => ESTRUTURA_V87
  }
end
