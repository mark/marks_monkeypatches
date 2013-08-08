require 'date'

require 'date/relative'
require 'date/date_range'
require 'date/cal'

class ::Date
  include DateRelative
  include DateRange::DateHelpers
  include CalPrinter::DateHelpers
end
