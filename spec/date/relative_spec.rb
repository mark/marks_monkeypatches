require 'spec_helper'

describe DateRelative do

  describe :days_in_month do

    let(:january_day) { Date.new(2013, 1, 1) }

    let(:february_during_leap_year) { Date.new(2012, 2, 1) }
    
    let(:feburary_not_during_leap_year) { Date.new(2013, 2, 1) }
    
    it "should give the right number of days in a month" do
      january_day                  .days_in_month.must_equal 31
      feburary_not_during_leap_year.days_in_month.must_equal 28
      february_during_leap_year    .days_in_month.must_equal 29
    end

  end

  describe :start_of_week do

    let(:monday) { Date.new(2013, 8, 5) }

    let(:sunday) { Date.new(2013, 8, 4) }
    
    it "should give the right start of the week" do
      sunday.start_of_week.must_equal sunday
      monday.start_of_week.must_equal sunday
    end

  end

  describe :end_of_week do    

    let(:monday) { Date.new(2013, 8, 5) }
    
    let(:saturday) { Date.new(2013, 8, 10) }

    it "should give the right end of the week" do
      monday  .end_of_week.must_equal saturday
      saturday.end_of_week.must_equal saturday
    end

  end

  describe :start_of_month do

    it "should return the first of that month" do
      Date.new(2013, 8, 14).start_of_month.must_equal Date.new(2013, 8, 1)
    end

  end

  describe :end_of_month do

    it "should return the last day of that month" do
      Date.new(2013, 8, 14).end_of_month.must_equal Date.new(2013, 8, 31)
    end

  end

end
