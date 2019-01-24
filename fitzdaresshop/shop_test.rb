require_relative './shop'

# Test 1
test1 = Checkout.new
test1.scan('GR1')
test1.scan('SR1')
test1.scan('GR1')
test1.scan('GR1')
test1.scan('CF1')
price = test1.total
expected = '£22.45'
if price == expected
  p "Correct price of #{expected}"
else
  p "Price expected was #{expected}, price calculated was #{price}"
end

# Test 2
test2 = Checkout.new
test2.scan('GR1')
test2.scan('GR1')
price = test2.total
expected = '£3.11'
if price == expected
  p "Correct price of #{expected}"
else
  p "Price expected was #{expected}, price calculated was #{price}"
end

# Test 3
test3 = Checkout.new
test3.scan('SR1')
test3.scan('SR1')
test3.scan('GR1')
test3.scan('SR1')
price = test3.total
expected = '£16.61'
if price == expected
  p "Correct price of #{expected}"
else
  p "Price expected was #{expected}, price calculated was #{price}"
end
