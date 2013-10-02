  class CalPrinter

  ################
  #              #
  # Declarations #
  #              #
  ################
  
  attr_reader :root_day

  DAY_FORMATS       = { true => "%_d", false => "  " }
  
  DAYS_OF_WEEK_LINE = %(Su Mo Tu We Th Fr Sa)

  HEADER_FORMAT     = "%B %Y"

  LINE_WIDTH        = 20
  
  ###############
  #             #
  # Constructor #
  #             #
  ###############
  
  def initialize(root_day)
    @root_day = root_day
  end

  #################
  #               #
  # Class Methods #
  #               #
  #################
  
  def self.print(root_day)
    puts new(root_day).to_a
  end

  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def to_a
    Array.new.tap do |lines|
      lines << header_line
      lines << DAYS_OF_WEEK_LINE

      lines.concat week_lines
    end
  end

  private

  def day_string(day)
    day.strftime DAY_FORMATS[ in_month?(day) ]
  end

  def header_line
    root_day.strftime(HEADER_FORMAT).center(LINE_WIDTH)
  end

  def in_month?(day)
    root_day.month == day.month
  end

  def week_line(week)
    week.map { |day| day_string(day) }.join ' '
  end

  def week_lines
    weeks.map { |week| week_line(week) }
  end

  def weeks
    root_day.month_of.in_weeks
  end

end
