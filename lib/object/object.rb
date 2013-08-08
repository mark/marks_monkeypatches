class ::Object

  def another(*args, &block)
    self.class.new(*args, &block)
  end

end
