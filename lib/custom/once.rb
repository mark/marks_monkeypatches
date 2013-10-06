module Solo

  def self.new(meth_hash = {})
    Object.new.tap do |object|
      meta = class << object; self; end

      meth_hash.each do |method_names, return_value|
        Array(method_names).each do |method_name|
          meta.send(:define_method, method_name) { return_value }
        end
      end
    end
  end

end

class GreyGoo < BasicObject

  def method_missing(meth, *args, &block)
    self
  end

  def nil?
    true
  end

end
