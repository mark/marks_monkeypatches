require 'spec_helper'

describe Struct do

  MyStructRead = Struct.new(:first, :second, :third)

  describe "without skipping header" do

    subject { MyStructRead.parse('spec/struct/sample.csv') }

    it "should return 3 elements" do
      subject.length.must_equal 3
    end

    it "should have the header first" do
      subject[0].must_equal MyStructRead.new('foo', 'bar', 'baz')
    end
    
  end

  describe "with skipping header" do

    subject { MyStructRead.parse('spec/struct/sample.csv', skip_header: true) }

    it "should return 2 elements" do
      subject.length.must_equal 2
    end

    it "should have the other elements" do
      subject[0].must_equal MyStructRead.new('1', '2', '3')
      subject[1].must_equal MyStructRead.new('4', '5', '6')
    end
    

  end

end
