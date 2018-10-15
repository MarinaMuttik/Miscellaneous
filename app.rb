# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

require "pry"

module CONVERT_CHARA

  def alph_hash
    alphabet_arr = ("A".."Z").to_a
    n = 0
    @hash_conversion = {}
    alphabet_arr.each do |l|
      n += 1
      @hash_conversion[l] = n
    end
    @hash_conversion
  end

  def convert_name(name)
    char_arr = name.split(//).to_a
    @num_value = []
    char_arr.each do |char|
    @num_value << @hash_conversion[char]
    end
    @num_sum = @num_value.sum
  end

end

class NameCalculator
  def initialize(namelist)
    @namelist = File.read(namelist).scan(/\w+/).sort
  end

def perform

  extend CONVERT_CHARA
  alph_hash
  @alpha_value = 0
  @total_score = {}

  @namelist.each do |name|
    @alpha_value += 1
    convert_name(name)
    @total_score[name] = @alpha_value * @num_sum
  end

  @overall_total = 0
  @total_score.each do |name, score|
      @overall_total += score
    end
  #puts "The total score for each name is:"
  #print @total_score
  #puts "\n"
  puts "Overall Total for the name list is: #{@overall_total.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse}"

end
end

#NameCalculator.new("names.txt")

binding.pry
