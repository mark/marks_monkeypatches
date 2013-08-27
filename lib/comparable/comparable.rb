module ::Comparable

  def max(other)
    self > other ? self : other
  end

  def min(other)
    self > other ? other : self
  end

end
