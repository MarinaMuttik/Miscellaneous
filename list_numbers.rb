# Testing

expected = "-6,-3-1,3-5,7-11,14,15,17-20"
result = solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])

if expected == result
  "The expected result of #{result} was achieved"
else
  "Test failed: expected #{expected}, received #{result}"
end
