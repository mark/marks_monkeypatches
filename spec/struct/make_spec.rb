require 'spec_helper'

describe StructMake do

  MyStructMake = Struct.new(:foo, :bar)

  it "should be the same as via new" do
    MyStructMake.make([1,2]).must_equal MyStructMake.new(1, 2)
  end

end
