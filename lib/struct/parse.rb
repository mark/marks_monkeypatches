require 'csv'

module StructParse

  def parse(filename, options = {})
    skip_header = options.fetch(:skip_header) { false }
    
    contents    = CSV.read(filename)
    contents    = contents[1..-1].to_a if skip_header

    contents.map { |array| self.new(*array) }
  end

end
