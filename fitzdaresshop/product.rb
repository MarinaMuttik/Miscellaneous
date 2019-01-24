# Class to store product details which can be updated and added to
class Product
  attr_accessor :name, :code, :price
  def initialize(name, code, price)
    @name = name
    @code = code
    @price = price
  end
end
