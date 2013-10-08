require 'spec_helper'

describe Pointer do

  describe :~ do

    it "defaults to nil" do
      (~Pointer.new).must_be_nil
    end

    it "can be assigned in the constructor" do
      (~Pointer.new(:foo)).must_equal :foo
    end

  end

  describe :<= do

    it "assigns the pointed value" do
      ptr = Pointer.new
      ptr <= :foo
      (~ptr).must_equal :foo
    end
  end

  describe :tapp do

    it "yields itself" do
      yielded = nil
      pointer = Pointer.new
      
      pointer.tapp do |ptr|
        yielded = ptr
      end

      yielded.must_equal pointer
    end

    it "returns the last assigned value" do
      Pointer.new.tapp do |ptr|
        ptr <= :foo
        ptr <= :bar
      end.must_equal :bar
    end

  end

end
