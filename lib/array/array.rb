require 'array/transformer'

class ::Array

  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def many?
    if block_given?
      count = 0
      each do |obj|
        count += 1 if yield(obj)
        return true if count > 1
      end
      false
    else
      length > 1
    end
  end

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
