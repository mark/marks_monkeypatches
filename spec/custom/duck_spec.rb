require 'spec_helper'

describe Duck do

  DuckStruct = Struct.new(:foo, :bar, :baz)

  subject { DuckStruct.new(1, 2, 3) }

  it "should match a single method" do
    Duck.new(:foo).quack?(subject).must_equal true
    (Duck.new(:foo) =~ subject).must_equal true
  end

  it "should not match a method it doesn't respond to" do
    Duck.new(:quux).quack?(subject).wont_equal true
    (Duck.new(:quux) =~ subject).wont_equal true
  end

  it "should match with two methods" do
    Duck.new(:foo, :bar).quack?(subject).must_equal true
    (Duck.new(:foo, :bar) =~ subject).must_equal true
  end

  it "should match with an array of methods" do
    Duck.new([:foo, :bar, :baz]).quack?(subject).must_equal true
    (Duck.new([:foo, :bar, :baz]) =~ subject).must_equal true
  end

  it "should not match with one of two methods" do
    Duck.new(:foo, :quux).quack?(subject).wont_equal true
    (Duck.new(:foo, :quux) =~ subject).wont_equal true
  end

  it "should respond to threequals" do
    case subject
    when Duck.new(:quux) then false
    when Duck.new(:foo, :quux) then false
    when Duck.new(:foo, :bar, :baz) then true
    else false
    end.must_equal true
  end

  describe :kernel_methods do

    it "should create a duck" do
      duck(:foo, :bar).quack?(subject).must_equal true
      duck(:foo, :quux).quack?(subject).wont_equal true
    end

  end

  describe :object_methods do

    it "should create a duck" do
      subject.duck?(:foo, :bar).must_equal true
      subject.duck?(:foo, :quux).wont_equal true
    end

  end

end
