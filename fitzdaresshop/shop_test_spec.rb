require_relative './shop'


## Test 1
test1 = Checkout.new(pricing_rules)
test1.scan('GR1')
test1.scan('SR1')
test1.scan('GR1')
test1.scan('GR1')
test1.scan('CF1')
p price = test1.total

## Test 2
test2 = Checkout.new(pricing_rules)
test2.scan('GR1')
test2.scan('GR1')
p price = test2.total

## Test 3
test3 = Checkout.new(pricing_rules)
test3.scan('SR1')
test3.scan('SR1')
test3.scan('GR1')
test3.scan('SR1')
p price = test3.total


# add assert equals
