module Option

  ##########
  #        #
  # Errors #
  #        #
  ##########

  class NoDefaultError < StandardError; end

  ##################
  #                #
  # Module Methods #
  #                #
  ##################
  
  def self.[](object)
    case object
    when Some, None then object
    when NilClass   then None.instance
                    else Some.new(object)
    end
  end

  def self.all?(*args)
    objects = []

    args.each do |arg|
      opt = maybe(arg)

      opt.is?   { |obj| objects << obj }
      opt.isnt? { return }
    end

    yield(*objects)
  end

  ###############
  #             #
  # Some Option #
  #             #
  ###############
  
  class Some

    def initialize(object)
      @__object__ = object
    end

    def fetch(*args)
      raise NoDefaultError unless args.length > 0 || block_given?
      @__object__
    end

    def is?
      block_given? ? yield(@__object__) : true
    end
    
    def isnt?(null_obj = nil)
      false
    end

    def tap_is?
      yield(@__object__)
      self
    end

    def tap_isnt?(null_obj = nil)
      self
    end

    def try(meth = nil)
      value = block_given? ? yield(@__object__) : @__object__.send(meth)
      maybe( value )
    end

  end

  ###############
  #             #
  # None Option #
  #             #
  ###############
  
  class None

    include Singleton

    def fetch(*args)
      if block_given?
        yield
      elsif args.any?
        args[0]
      else
        raise NoDefaultError
      end
    end

    def is?
      false
    end
    
    def isnt?(null_obj = nil)
      block_given? ? yield( null_obj ) : true
    end

    def tap_is?
      self
    end

    def tap_isnt?(null_obj = nil)
      yield(null_obj)
      self
    end

    def try(meth = nil)
      self
    end

  end
 
end