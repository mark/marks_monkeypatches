class ::Object

  def another(*args, &block)
    self.class.new(*args, &block)
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
end
