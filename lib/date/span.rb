module DateSpan

  def day_of
    self.upto(self)
  end

  def week_of
    start_of_week.upto(end_of_week)
  end

  def month_of
    start_of_month.upto(end_of_month)
  end

  def upto(end_date)
    FriendlyDateRange.new(self, end_date)
  end

end