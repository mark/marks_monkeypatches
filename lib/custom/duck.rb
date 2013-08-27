class Duck

  def initialize(*methods)
    @methods = methods.flatten
  end

  def ===(object)
    quack?(object)
  end

  def =~(object)
    quack?(object)
  end

  def quack?(object)
    @methods.all? { |meth| object.respond_to?(meth) }
  end

end
