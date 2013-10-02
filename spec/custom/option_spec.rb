require 'spec_helper'

describe Option do

  describe :something do

    subject { Option[something] }

    let(:something) { Object.new }

    it "should be is?" do
      subject.is?.must_equal true
    end

    it "should yield the object to is?" do
      yielded = nil

      subject.is? { |obj| yielded = obj }

      yielded.must_equal something
    end

    it "shouldn't be isn't?" do
      subject.isnt?.must_equal false
    end

  end

  describe :nothing do

    subject { Option[nil] }

    it "shouldn't be is?" do
      subject.is?.must_equal false
    end

    it "shoudln't call the block with is?" do
      called = false

      subject.is? { called = true }

      called.must_equal false
    end

    it "should be isnt?" do
      subject.isnt?.must_equal true
    end

    it "should call the block with isn't?" do
      called = false

      subject.isnt? { called = true }

      called.must_equal true
    end

    it "should yield a null object if one is passed in" do
      yielded = nil

      subject.isnt?(:bar) { |null| yielded = null }

      yielded.must_equal :bar
    end

  end

  describe :& do

    let(:obj1) { maybe(1) }
    let(:obj2) { maybe(2) }
    let(:none) { maybe(nil) }

    def and_test(first, second, expected)
      (first & second).try do |(a, b)|
        a + b
      end.fetch(0).must_equal expected
    end

    it "should combine the two" do
      and_test(obj1, obj2, 3)
    end

    it "shouldn't work if either are none" do
      and_test(obj1, none, 0)
      and_test(none, obj2, 0)
      and_test(none, none, 0)
    end

  end

  describe :get do

    let(:obj1) { maybe(1) }
    let(:obj2) { maybe(2) }
    let(:none) { maybe(nil) }

    def get_test(first, second, expected)
      result = maybe {
        x = first.get
        y = second.get

        x + y
      }

      result.must_equal expected
    end

    it "should work with Somes" do
      get_test(obj1, obj2, 3)
    end

    it "should work with Nones" do
      get_test(obj1, none, nil)
      get_test(none, obj2, nil)
      get_test(none, none, nil)
    end

    it "should fail outside of a maybe block" do
      lambda { obj1.get }.must_raise Option::UnprotectedGetError
      lambda { none.get }.must_raise Option::UnprotectedGetError
    end
  end

  describe :all? do

    let(:obj1) { maybe(1) }
    let(:obj2) { maybe(2) }
    let(:none) { maybe(nil) }

    def all_test(first, second, expected)
      result = Option.all?(first, second) do |x, y|
        x + y
      end

      result.must_equal expected
    end

    it "should work with Somes" do
      all_test(obj1, obj2, 3)
    end

    it "should work with Nones" do
      all_test(obj1, none, nil)
      all_test(none, obj2, nil)
      all_test(none, none, nil)
    end

  end
end
