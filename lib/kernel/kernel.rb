require 'date'

module ::Kernel

  def January  (day, year); Date.new(year,  1, day); end
  def February (day, year); Date.new(year,  2, day); end
  def March    (day, year); Date.new(year,  3, day); end
  def April    (day, year); Date.new(year,  4, day); end
  def May      (day, year); Date.new(year,  5, day); end
  def June     (day, year); Date.new(year,  6, day); end
  def July     (day, year); Date.new(year,  7, day); end
  def August   (day, year); Date.new(year,  8, day); end
  def September(day, year); Date.new(year,  9, day); end
  def October  (day, year); Date.new(year, 10, day); end
  def November (day, year); Date.new(year, 11, day); end
  def December (day, year); Date.new(year, 12, day); end

  def duck(*methods)
    Duck.new(methods)
  end

  def extract_options(array)
    if array[-1].kind_of? Hash
      return array[0...-1], array[-1]
    else
      return array, {}
    end
  end

  def t
    ThreequalsArray.new
  end

end
