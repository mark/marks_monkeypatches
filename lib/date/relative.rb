module DateRelative

  DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze

  def days_in_month
    if month == 2 && leap?
      29
    else
      DAYS_IN_MONTH[ month ]
    end
  end

  def start_of_week
    self - wday
  end

  def start_of_month
    self.class.new(year, month, 1)
  end

  def end_of_week
    self + (6 - wday)
  end

  def end_of_month
    self.class.new(year, month, days_in_month)
  end

end
