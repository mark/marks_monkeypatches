require 'spec_helper'

describe Object do

  describe :truthy do

    it "should call the block for truthy things" do
      results = []

      Object.new.truthy { results << 1 }
      123.truthy { results << 2 }
      true.truthy { results << 3 }

      results.must_equal [1, 2, 3]
    end

    it "should not call the block for falsy things" do
      results = []

      false.truthy { results << 1 }
      nil.truthy { results << 2 }

      results.must_equal []
    end

  end


end
