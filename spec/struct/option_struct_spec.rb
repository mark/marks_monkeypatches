require 'spec_helper'

describe OptionStruct do

  subject { OptionStruct.new(:foo, :bar) }

  it "maybes all of its arguments" do
    obj = subject.new(123, nil)
    obj.foo.kind_of? Option::Some
    obj.bar.kind_of? Option::None
  end

end
