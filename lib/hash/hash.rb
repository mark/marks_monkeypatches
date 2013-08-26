class ::Hash

  #################
  #               #
  # Class Methods #
  #               #
  #################
  
  def self.of
    Hash.new { |h, k| h[k] = yield }
  end

  def self.of_arrays
    Hash.of { [] }
  end

  def self.of_hashes
    Hash.of { {} }
  end

  def self.of_numbers
    Hash.of { 0  }
  end

  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def except(*keys)
    keys = keys.flatten

    reject { |key, value| keys.include?(key) }
  end

  def extract(*keys)
    keys = keys.flatten

    Hash.new.tap do |hash|
      keys.each { |k| hash[k] = delete(k) if has_key?(k) }
    end
  end

  def only(*keys)
    keys = keys.flatten

    select { |key, value| keys.include?(key) }
  end

  def resolve(other)
    Hash.new.tap do |result|
      (self.keys | other.keys).each do |key|
        result[key] = \
          if self.has_key?(key) && other.has_key?(key) && self[key] != other[key]
            yield key, self[key], other[key]
          elsif self.has_key?(key)
            self[key]
          else
            other[key]
          end
      end
    end
  end

end
