require 'array/transform'

class ::Array

  include ArrayTransform
  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def rest
    self[1..-1].to_a
  end

  def subsets
    if empty?
      [ [] ]
    else
      recurse = rest.subsets
      
      recurse + recurse.map { |s| [first] + s }
    end
  end

end
