require 'spec_helper'

describe Solo do

  it "handles a single method" do
    obj = Solo.new foo: :bar

    obj.respond_to?(:foo).must_equal true
    obj.foo.must_equal :bar
  end

  it "handles two methods with the same return value" do
    obj = Solo.new %w(foo bar) => :baz

    obj.respond_to?(:foo).must_equal true
    obj.respond_to?(:bar).must_equal true
    obj.foo.must_equal :baz
    obj.bar.must_equal :baz
  end

  it "handles two different return values" do
    obj = Solo.new foo: :bar, baz: :quux

    obj.respond_to?(:foo).must_equal true
    obj.respond_to?(:baz).must_equal true
    obj.foo.must_equal :bar
    obj.baz.must_equal :quux
  end

end

Null = Solo.new [:by_term?, :by_credits?] => false, :by_all_courses? => true

describe GreyGoo do

end
