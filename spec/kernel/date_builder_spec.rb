require 'spec_helper'

describe Kernel do

  it "should define methods for the months" do
    day = January 3, 2005
    day.must_equal Date.new(2005, 1, 3)
  end

end
