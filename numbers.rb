require 'csv'

puts "Welcome to the addition game! How many rounds would you like to play?"
turns = 0
totalturns = gets.chomp.to_i
correct = 0
wrong = 0
start = Time.now

while turns < totalturns
  turns += 1
  x = Random.rand(1..10)
  y = Random.rand(1..10)
  puts "#{x} + #{y} = "

  puts "Answer please!"
  answer = gets.chomp.to_i

  if x + y == answer
    puts "Correct"
    puts "\n"
    correct += 1
  else
    puts "False :-("
    puts "\n"
    wrong += 1
  end

end

duration = (Time.now - start).round(2)

puts "\n"
puts "Correct: #{correct}; Wrong: #{wrong}, Total Rounds: #{totalturns}"

score = (100*correct/totalturns).to_i
puts "\n"
puts "Well done, you have completed the game with a total score of #{score}% in a time of #{duration} seconds, #{duration/totalturns} seconds per turn!"
puts "\n"
puts "Name?"
player = gets.chomp

filename = "numbergamedata.csv"
file = CSV.open(filename, "a+") do |csv|
  #csv << ["Player", "Score (%)", "Duration (seconds)", "Total Turns"] #used to setup csv file columns
    csv << [player, score, duration, totalturns]
  end
file.close
