$num_to_name = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine'
}

# Method to convert integer input to words
class Integer
  def to_words
    $num_to_name[self]
  end
end
