# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
#So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?
require "pry"

class NameCalculator
  attr_reader :namelist
  def initialize(namelist)
    @namelist ||= File.read(namelist).scan(/\w+/).sort
  end

  def convert_name(name) #convert name to upcase chars array, map using alphabet hash to convert chars to numerical score, return the summed value of the char values
    alphabet_num_hash
    name_alph_value = name.upcase.chars.map.sum do |char|
      @alphabet_num_hash[char]
    end
  end

  def name_scores #cycle through namelist, mapping to a hash the name to the key and the value as the index multiplied by the name chars score from convert_name
    name_scores_arr = {}
    @namelist.each.with_index(1) do |name, index|
      name_scores_arr[name] = index * convert_name(name)
    end
    name_scores_arr
  end

  def namelist_total # sum the scores of every name in the namelist to produce an overall namelist total
    @namelist_total ||= name_scores.values.sum
  end

  def alphabet_num_hash
    @alphabet_num_hash ||= ( ( "A".."Z" ).to_a.zip( ( 1..26 ).to_a) ).to_h
  end

  def add_commas_to_num(num)
    num
      .to_s
      .chars
      .to_a #convert num to array of string characters
      .reverse
      .each_slice(3) #reverse characters and slice after each 3rd number character
      .map(&:join)
      .join(",")
      .reverse #rejoin numbers with a comma in each gap and reverse back to normal
  end

  def perform # run through the methods to output the overall namelist total as a string with comma formatting for the number
    start_time = Time.now
    namelist_total
    puts "Overall Total for the name list is: #{add_commas_to_num( @namelist_total )}"
    puts "Time taken: #{( ( Time.now - start_time ) * 1000 ).round(2)} miliseconds"
  end

end

#NameCalculator.new("names.txt")
binding.pry
