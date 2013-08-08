require 'array/transform'
require 'array/subset'

class ::Array
  include ArrayTransform
  include ArraySubset
end
