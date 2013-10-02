class Goose

  def initialize(*methods)
    @methods = methods.flatten
  end

  def ===(object)
    honk?(object)
  end

  def =~(object)
    honk?(object)
  end

  def bite(object)
    meth = @methods.detect { |m| object.respond_to?(meth) }

    object.send(meth)
  end

  def honk?(object)
    @methods.any? { |meth| object.respond_to?(meth) }
  end

end
