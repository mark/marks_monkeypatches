module ArrayTransform

  class Transformer
    
    def initialize(old_array, new_array)
      @inserted = new_array - old_array
      @removed  = old_array - new_array
    end

    def insert
      @inserted.each { |obj| yield obj }
    end
    
    def remove
      @removed.each  { |obj| yield obj }
    end
    
  end

  def transform(new_array)
    delta = Transformer.new(self, new_array)
    
    yield(delta)
    
    self
  end
  
end