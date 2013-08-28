class ::Array::Transformer

  ###############
  #             #
  # Constructor #
  #             #
  ###############

  def initialize(old_array, new_array)
    @old_array = old_array
    @new_array = new_array
    @inserted  = new_array - old_array
    @removed   = old_array - new_array
    @kept      = old_array & new_array
  end

  ####################
  #                  #
  # Instance Methods #
  #                  #
  ####################
  
  def insert
    @inserted.each { |obj| yield obj }
  end

  def insert_count
    yield @inserted.length
  end

  def keep
    @kept.each { |obj| yield obj }
  end
  
  def keep_count
    yield @kept.length
  end

  def new_items
    @new_array.each { |obj| yield obj }
  end

  def new_items_count
    yield @new_array.length
  end

  def old_items
    @old_array.each { |obj| yield obj }
  end

  def old_items_count
    yield @old_array.length
  end

  def remove
    @removed.each { |obj| yield obj }
  end
  
  def remove_count
    yield @removed.length
  end

end
