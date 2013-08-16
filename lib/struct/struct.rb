require 'csv'

class ::Struct

  #################
  #               #
  # Class Methods #
  #               #
  #################
  
  def self.make(array)
    new(*array)
  end

  def self.parse(filename, options = {})
    skip_header = options.fetch(:skip_header) { false }
    
    contents    = CSV.read(filename)
    contents    = contents[1..-1].to_a if skip_header

    contents.map { |array| self.make(array) }
  end

end
