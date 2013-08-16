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

end
