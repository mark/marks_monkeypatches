class DateRange

  ################
  #              #
  # Declarations #
  #              #
  ################
  
  include Enumerable

  attr_reader :start_day, :end_day

  ###########
  #         #
  # Modules #
  #         #
  ###########
  
  module DateHelpers

    def day_of
      DateRange.new(self, self)
    end

    def week_of
      DateRange.new(start_of_week, end_of_week)
    end

    def month_of
      DateRange.new(start_of_month, end_of_month)
    end

  end

  ###############
  #             #
  # Constructor #
  #             #
  ###############
  
  def initialize(start_day, end_day)
    @start_day = start_day
    @end_day   = end_day
  end

  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def day_after
    end_day + 1
  end

  def day_before
    start_day - 1
  end

  def each(&block)
    step(1, &block)
  end

  def each_week
    step(7) { |day| yield day.week_of }
  end

  def in_weeks
    Array.new.tap do |weeks|
      each_week { |week| weeks << week }
    end
  end

  def step(step)
    current = start_day

    while current <= end_day
      yield(current)
      current += step
    end

    self
  end

end
