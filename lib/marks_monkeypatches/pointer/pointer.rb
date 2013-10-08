class Pointer

  ##############
  #            #
  # Initialize #
  #            #
  ##############
  
  def initialize(obj = nil)
    @object = obj
  end

  #############
  #           #
  # Operators #
  #           #
  #############
  
  def <=(obj)
    @object = obj
  end

  def ~
    @object
  end

  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def tapp
    yield(self)
    ~self
  end

end
