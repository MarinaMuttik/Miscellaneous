class Checkout
  def initialize(pricing_rules)
    @basket = []
    @basket_total = 0
    @product_names = { 'GR1' => 'Green Tea', 'SR1' => 'Strawberries', 'CF1' => 'Coffee' }
    @product_prices = { 'GR1' => 3.11, 'SR1' => 5.00, 'CF1' => 11.23 }
  end

  def scan(item)
    @basket << item
  end

  # retrieve prices by iterating through basket and sum
  def calc
    @basket.uniq.sum do |item|
      if item == 'SR1'
        if @basket.count('SR1') >= 3
          4.5 * @basket.count('SR1')
        else
          @product_prices['SR1'] * @basket.count('SR1')
        end
      elsif item == 'GR1'
        if @basket.count('GR1') >= 2
          free_items = @basket.count('GR1') / 2
          discount = free_items * @product_prices['GR1']
          @product_prices['GR1'] * @basket.count('GR1') - discount
        else
          @product_prices['GR1']
        end
      else
        @product_prices[item] * @basket.count(item)
      end
    end
  end

  def total
    "£#{calc.round(2)}"
  end

  end

# basket as a hash
# add a receipt
# product and prod catalogue as separate classes (even for pricing rule and different offers)
