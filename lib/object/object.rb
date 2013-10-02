class ::Object

  def another(*args, &block)
    self.class.new(*args, &block)
  end

  def duck?(*methods)
    Duck.new(methods).quack?(self)
  end

  def falsy
    self || yield
  end
  
  def in?(container)
    if container.respond_to? :cover?
      container.cover?(self)
    elsif container.respond_to? :include?
      container.include?(self)
    else
      raise ArgumentError, "#{ container } does not respond to #cover? or #include?"
    end
  end

  def m?
    Option[self]
  end

  def present?
    ! nil?
  end

  def required!
    nil? ? yield : self
  end

  def to_b
    !! self
  end

  def truthy
    self && yield
  end

end
