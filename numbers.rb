puts "Welcome to the addition game! How many rounds would you like to play?"
turns = 0
totalturns = gets.chomp.to_i

correct = 0
wrong = 0

while turns < totalturns
turns = turns + 1
  start = Time.now
  x = Random.rand(1..10)
  y = Random.rand(1..10)
  puts "#{x} + #{y} = "

  puts "Answer please!"
  answer = gets.chomp.to_i

  if x + y == answer
  puts "Correct"
  correct += 1
  else
  puts "False :-("
  wrong += 1
  end

end

duration = Time.now - start

puts "\n"
puts "Correct: #{correct}; Wrong: #{wrong}, Total Rounds: #{totalturns}"

score = (100*correct/totalturns).to_i
puts "\n"
puts "Well done, you have completed the game with a total score of #{score}% in a time of #{duration} seconds, #{duration/totalturns} seconds per turn!"
puts "\n"
puts "Name?"
player = gets.chomp

filename = "scores.txt"
file = File.open(filename, "a+")
file.write "#{player}: #{score}%, #{duration} seconds, #{totalturns} turns"
file.close
