require 'spec_helper'

describe ArrayTransform do

  it "should be defined on array" do
    Array.instance_methods.must_include :transform
  end

  let(:old_array) { [1, 2, 3, 4, 5] }
  let(:new_array) { [3, 4, 5, 6, 7] }

  describe "inserting objects" do

    it "should call insert with inserted objects" do
      inserted = []

      old_array.transform(new_array) do |delta|
        delta.insert { |obj| inserted << obj }
      end

      inserted.length.must_equal 2
      inserted.must_include 6
      inserted.must_include 7
    end

  end

  describe "removing objects" do

    it "should call remove with removed objects" do
      removed = []

      old_array.transform(new_array) do |delta|
        delta.remove { |obj| removed << obj }
      end

      removed.length.must_equal 2
      removed.must_include 1
      removed.must_include 2
    end

  end

end
