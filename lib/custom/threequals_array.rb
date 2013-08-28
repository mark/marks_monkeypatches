class ThreequalsArray

  def initialize
    @types = []
  end

  def [](*args)
    @types = args
    self
  end

  def ===(array)
    array = [array] unless array.kind_of?(Array)

    return false unless array.length == @types.length
    
    array.each_with_index do |element, idx|
      return false unless @types[idx] === element
    end

    true
  end

end
