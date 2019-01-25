$num_to_name = {
  0 => '',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
  100 => 'one hundred',
  1000 => 'one thousand'
}

# Method to convert integer input to words
class Integer
  def to_words
    if $num_to_name[self]
      $num_to_name[self]
    else
      num = self.to_s.chars
      num[-1] = $num_to_name[num[-1].to_i] if num[-1]
      num[-2] = $num_to_name[(num[-2] + '0').to_i] if num[-2]
      num[-3] = $num_to_name[num[-3].to_i] + ' hundred' if num[-3]
      num[-4] = $num_to_name[num[-4].to_i] + ' thousand' if num[-4]

      num.join(' ').strip
    end
  end
end
