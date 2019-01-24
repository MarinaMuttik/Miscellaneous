module Offers
  module Bogof
    def apply_bogof(product)
      prod_count = @basket.count(product)
      if prod_count >= 2
        free_items = prod_count / 2
        p "Offer applied - #{free_items} free #{product.name}"
        total_discount = free_items * product.price
        p "Total saving - £#{total_discount}"
        @basket_total -= total_discount
        p "Current total: £#{@basket_total}"
      end
    end
  end

  module Bulk
    def apply_bulk(product)
      discount = 0.5
      prod_count = @basket.count(product)
      if prod_count >= 3
        total_discount = discount * prod_count
        p "Offer applied - £#{discount} on #{prod_count} #{product.name}"
        p "Total saving - £#{total_discount}"
        @basket_total -= total_discount
        p "Current total: £#{@basket_total}"
      end
    end
  end

  def apply_offers
    extend Bogof
    apply_bogof($gr1)
    extend Bulk
    apply_bulk($sr1)
  end
end