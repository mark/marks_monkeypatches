require 'array/transformer'

class ::Array

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

  def transform(new_array)
    delta = Array::Transformer.new(self, new_array)
    
    yield(delta)
    
    self
  end
  
end
