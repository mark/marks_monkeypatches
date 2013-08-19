require 'spec_helper'

describe Hash do

  describe :of_arrays do

    subject { Hash.of_arrays }

    it "should return arrays for every key" do
      subject[:foo].must_be_instance_of(Array)
    end

    it "should accept pushes on any key" do
      subject[:foo] << :bar
    end

    it "should remember what it returns" do
      ary = subject[:foo]
      ary << 1 << 2 << 3
      subject[:foo].must_equal [1, 2, 3]
    end

  end

  describe :of_hashes do

    subject { Hash.of_hashes }

    it "should return hashes for every key" do
      subject[:foo].must_be_instance_of(Hash)
    end

    it "should accept fetches on any key" do
      subject[:foo].fetch(:bar) { :baz }
    end

    it "should remember what it returns" do
      ary = subject[:foo]
      ary.merge!(a: 1, b: 2, c: 3)
      subject[:foo].must_equal( { a: 1, b: 2, c: 3 } )
    end

  end

  describe :of_numbers do

    subject { Hash.of_numbers }

    it "should return numbers for every key" do
      subject[:foo].must_be_instance_of(Fixnum)
    end

    it "should accept += on any key" do
      subject[:foo] += 1
      subject[:foo].must_equal 1
    end

  end

  describe :resolve do

    let(:old_hash) { { a: 1, b: 2, c: 3 } }
    let(:new_hash) { { b: 2, c: 4, d: 5 } }

    it "should be the same as merge when always using the new value" do
      old_hash.resolve(new_hash) { |k, oldv, newv| newv }.must_equal old_hash.merge(new_hash)
    end

    it "should be the same as reversed merge when always using the old value" do
      old_hash.resolve(new_hash) { |k, oldv, newv| oldv }.must_equal new_hash.merge(old_hash)
    end

  end


end
