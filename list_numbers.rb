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

expected = '-6,-3-1,3-5,7-11,14,15,17-20'
result = solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])

if expected == result
  p "Test passed: The expected result of #{result} was achieved"
else
  p "Test failed: expected #{expected}, received #{result}"
end
