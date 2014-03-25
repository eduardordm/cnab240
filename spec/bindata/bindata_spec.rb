require 'spec_helper'

describe "Bindata" do

  it "should work" do
    class Dummy < BinData::Record
      string :f1, :length => 3, :pad_byte => '1'
      string :f2, :length => 4, :initial_value => '0000', :pad_byte => '0'
      string :f3, :length => 9, :pad_byte => 'X'
    end

    d1 = Dummy.new
    s1 = StringIO.new
    d1.write(s1)

    d2 = Dummy.read(s1.string)
    s2 = StringIO.new
    d2.write(s2)

    s1.string.should eq s2.string

    class Dummy2 < BinData::Record
      string :f1, :length => 3, :pad_byte => '1'
      string :f2, :value => '0000', :pad_byte => '0', :read_length => 4
      string :f3, :length => 9, :pad_byte => 'X'
    end

    d1 = Dummy2.new
    s1 = StringIO.new
    d1.write(s1)

    d2 = Dummy2.read(s1.string)
    s2 = StringIO.new
    d2.write(s2)

    s1.string.should eq s2.string
  end

  it "should pad left" do
    class Dummy3 < BinData::Record
      lstring :f2, :length => 4, :pad_byte => '0'
    end

    d1 = Dummy3.new
    d1.f2 = '1'
    s1 = StringIO.new
    d1.write(s1)

    d2 = Dummy3.read(s1.string)
    d2.f2.should eq('0001')
  end
end
