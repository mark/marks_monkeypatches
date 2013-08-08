module ::Enumerable

  def hashify
    Hash.new.tap do |hash|
      each_with_index do |obj, index|
        key = yield(obj, index)

        hash[key] = obj
      end
    end
  end

  def reverse_hashify
    Hash.new.tap do |hash|
      each_with_index do |obj, index|
        value = yield(obj, index)

        hash[obj] = value
      end
    end
  end

  def double_hashify
    Hash.new.tap do |hash|
      each_with_index do |obj, index|
        key, value = yield(obj, index)

        hash[key] = value
      end
    end
  end

end
