require 'spec_helper'

describe Array do

  describe :rest do

    it "returns an empty array on an empty array" do
      [].rest.must_equal []
    end

    it "returns an empty array on a single element array" do
      [:foo].rest.must_equal []
    end

    it "returns all but the first element on a multi element array" do
      [:foo, :bar, :baz, :quux].rest.must_equal [:bar, :baz, :quux]
    end

  end

  describe :subsets do

    it "returns the empty array as a subset for the empty set" do
      [].subsets.must_equal [ [] ]
    end

    it "returns the subsets of a single element array" do
      [1].subsets.sort.must_equal [ [], [1] ]
    end

    it "returns the subsets of a two element array" do
      [1, 2].subsets.sort.must_equal [ [], [1], [2], [1,2] ].sort
    end

    it "returns the subsets of a three element array" do
      [1, 2, 3].subsets.sort.must_equal [ [], [1], [2], [3], [1,2], [1,3], [2,3], [1,2,3] ].sort
    end

  end

end
