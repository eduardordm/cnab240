require 'spec_helper'

RSpec.describe Cnab240 do
  it 'deve ter campos de configuracao' do
    Cnab240.setup do |c|
      expect(c).to respond_to(:defaults)
      c.defaults[:empresa_tipo] = '1'
    end
    expect(Cnab240.defaults[:empresa_tipo]).to eq('1')
  end

  it 'configuracao deve ter efeito' do
    Cnab240.setup do |config|
      config.defaults[:empresa_tipo] = '1'
    end
    expect(Cnab240.defaults[:empresa_tipo]).to eq('1')
    arquivo = Cnab240::Arquivo::Arquivo.new
    expect(arquivo.header.empresa_tipo).to eq('1')
  end
end
