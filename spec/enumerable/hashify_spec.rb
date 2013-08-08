require 'spec_helper'

describe "Hashify" do

  let(:array) { %w(Foo Bar Baz Quux) }

  subject { array.hashify { |str| str[0] } }

  it "should generate a hash" do
    subject.must_be_instance_of Hash
  end

  it "should map the result of a block to their source" do
    subject["F"].must_equal "Foo"
    subject["Q"].must_equal "Quux"
  end

  it "should keep the last such value" do
    subject["B"].must_equal "Baz"
  end

end

describe "Reverse Hashify" do

  let(:array) { %w(Foo Bar Baz) }

  subject { array.reverse_hashify { |str| str[0] } }

  it "should generate a hash" do
    subject.must_be_instance_of Hash
  end

  it "should map the result of a block to their source" do
    subject["Foo"].must_equal "F"
    subject["Bar"].must_equal "B"
    subject["Baz"].must_equal "B"
  end

end

describe "Double Hashify" do

  let(:array) { %w(Foo Bar Baz Quux) }

  subject { array.double_hashify { |str| [str[0], str[1..-1]] } }

  it "should generate a hash" do
    subject.must_be_instance_of Hash
  end

  it "should map the result of a block to their source" do
    subject["F"].must_equal "oo"
    subject["Q"].must_equal "uux"
  end

  it "should keep the last such value" do
    subject["B"].must_equal "az"
  end

end
