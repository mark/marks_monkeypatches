module Option

  ##########
  #        #
  # Errors #
  #        #
  ##########

  class NoneError           < StandardError; end

  class UnprotectedGetError < StandardError; end

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
    opts    = args.map { |obj| self[obj] }
    objects = []
    opts.each do |opt|
      return if opt.isnt?
      opt.is? { |obj| objects << obj }
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

    def &(other)
      other.is? do |obj|
        return maybe([@__object__, obj])
      end

      None.instance
    end

    def fetch(default = nil)
      @__object__
    end

    def get
      if $__maybe__
        @__object__
      else
        raise UnprotectedGetError
      end
    end

    def guard(cond)
      cond ? self : None.instance
    end

    def might(&block)
      is?(&block)
      self
    end

    def is?
      block_given? ? yield(@__object__) : true
    end
    
    def isnt?(null_obj = nil)
      false
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

    def &(other)
      self
    end

    def fetch(default = nil)
      if default
        default
      elsif block_given?
        yield
      else
        raise NoneError
      end
    end

    def get
      if $__maybe__
        throw :none_gotten
      else
        raise UnprotectedGetError
      end
    end

    def guard(cond)
      self
    end

    def is?
      false
    end
    
    def isnt?(null_obj = nil)
      block_given? ? yield( null_obj ) : true
    end

    def might
      self
    end

    def try(meth = nil)
      self
    end

  end
 
end