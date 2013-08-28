require 'spec_helper'

describe "Kernel#extract_options" do

  def my_method(*args)
    return extract_options(args)
  end

  it "always returns two items" do
    my_method().length.must_equal 2
    my_method(:foo, :bar).length.must_equal 2
    my_method(foo: :bar).length.must_equal 2
    my_method(:foo, bar: :baz).length.must_equal 2
  end

  it "always returns the options passed in" do
    my_method()[1].must_equal( {} )
    my_method(:foo, :bar)[1].must_equal( {} )
    my_method(foo: :bar)[1].must_equal( { foo: :bar } )
    my_method(:foo, bar: :baz)[1].must_equal( { bar: :baz } )
  end

  it "always returns the preceding arguments" do
    my_method()[0].must_equal( [] )
    my_method(:foo, :bar)[0].must_equal( [:foo, :bar] )
    my_method(foo: :bar)[0].must_equal( [] )
    my_method(:foo, bar: :baz)[0].must_equal( [:foo] )
  end

end
