require_relative './open_shop'

# Class to scan and checkout products and apply offers to produce a total price
class Checkout
  def initialize
    @basket = []
    @basket_total = 0
  end

  def scan(product)
    @basket << product
    @basket_total += product.price
    p "+ #{product.name} - £#{product.price}"
    p "Current total: £#{@basket_total.round(2)}"
  end

  def apply
    extend Offers
    apply_offers
  end

  def calc
    apply
    @basket_total
  end

  def total
    "£#{calc.round(2)}"
  end
end
