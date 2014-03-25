require 'spec_helper'

include Cnab240::V86

describe "Segmentos" do

  it "deve incluir mixin de segmento" do
    segmento = Cnab240::V86::SegmentoC.new
    segmento.should respond_to(:lote)
  end

end