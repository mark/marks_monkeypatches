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
  
  def except(key_or_keys)
    keys = Array(key_or_keys)

    reject { |key, value| keys.include?(key) }
  end
  
  def only(key_or_keys)
    keys = Array(key_or_keys)

    select { |key, value| keys.include?(key) }
  end

  def resolve(new_hash)
    Hash.new.tap do |result_hash|
      each do |key, value|
        result_hash[key] = \
          if new_hash.has_key?(key) && new_hash[key] != value
            yield key, value, new_hash[key]
          else
            value
          end
      end

      (new_hash.keys - keys).each do |new_key|
        result_hash[new_key] = new_hash[new_key]
      end
    end
  end

end
