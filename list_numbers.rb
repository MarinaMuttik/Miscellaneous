# Program to format a consecutive list of numbers given in array form into a
# string, condensed where there are 3 or more consecutive numbers with a dash

# Body

def solution(list)
  count = 0

  list.slice_after do |n|
    count += 1
    n.next != list[count]
  end.map do |ary|
    if ary.length > 2
      "#{ary.first}-#{ary.last}"
    else
      ary.join(',')
    end
  end.join(',')
end

# Testing

# Test 1 - consecutive numbers

expected1 = '-6,-3-1,3-5,7-11,14,15,17-20'
result1 = solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])

p 'Test 1 - consecutive numbers:'
if expected1 == result1
  p "Test passed: The expected result of #{result1} was achieved"
else
  p "Test failed: expected #{expected1}, received #{result1}"
end

# Test 2 - non-consecutive numbers

expected2 = '-4--1,3,4,6,8,11-13'
result2 = solution([-2, -3, -1, -4, 3, 4, 8, 6, 11, 13, 12])

p 'Test 2 - non-consecutive numbers:'
if expected2 == result2
  p "Test passed: The expected result of #{result2} was achieved"
else
  p "Test failed: expected #{expected2}, received #{result2}"
end
