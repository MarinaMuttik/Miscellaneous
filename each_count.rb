# method to return a count of discrete elements contained in the form of {element => count}
# solution to CodeWars Kata Array#each_count
# frozen_string_literal: true

=begin
class Array
  method_error = -> { 'Error: does not respond to given method' }
  method_block_error = -> { 'Error: both method and block provided!' }
  def each_count(method = nil, *args)
    if method.nil? && block_given? == false
      each_with_object(Hash.new(0)) { |key, value| value[key] += 1 }
    elsif method && block_given? == false
      map do |element|
        method_error.call unless element.respond_to?(method)
        element.send(method, *args)
      end.each_count
    elsif method.nil? && block_given?
      map { |element| yield element } .each_count
    elsif method && block_given?
      method_block_error.call
    end
  end
end
=end

class Array
  def count_hash
    each_with_object(Hash.new(0)) { |key, value| value[key] += 1 }
  end

  def handle_block
    map { |element| yield element }.count_hash
  end

  def send_method(method, *args)
    method_error = -> { 'Error: does not respond to given method' }
    map do |element|
      return method_error.call unless element.respond_to?(method)
      element.send(method, *args)
    end
    .count_hash
  end

  def each_count(method = nil, *args)
    method_block_error = -> { 'Error: both method and block provided!' }
    return method_block_error.call if method.nil? == false && block_given?
    return count_hash if method.nil? && block_given? == false
    return send_method(method, *args) if (method.nil? && block_given?) == false
    return handle_block(&Proc.new) if method.nil? && block_given?
  end
end

=begin
class Array
  def each_count(method = nil, *args)
    method_block_error = -> { 'Error: both method and block provided!' }
    method_error = -> { 'Error: does not respond to given method' }
    case method.nil?
    when true
      case block_given?
      when true
        map { |element| yield element } .each_count
      when false
        each_with_object(Hash.new(0)) { |key, value| value[key] += 1 }
      end
    when false
      case block_given?
      when true
        'method_block_error.call
      when false
        map do |element|
          method_error.call unless element.respond_to?(method)
          element.send(method, *args)
        end.each_count
      end
    end
  end
end
=end

cities = ['Melbourne', 'Dallas', 'Taipei', 'Toronto', 'Dallas', 'Kathmandu']

p cities.each_count
# => {'Melbourne'=>1, 'Dallas'=>2, 'Taipei'=>1, 'Toronto'=>1, 'Kathmandu'=>1}

p cities.each_count(:length)
# => {9=>2, 6=>3, 7=>1}

p cities.each_count(:gsub, /[aeiou]/, 'x')
# => {'Mxlbxxrnx'=>1, 'Dxllxs'=>2, 'Txxpxx'=>1, 'Txrxntx'=>1, 'Kxthmxndx'=>1}

p cities.each_count { |city| (city.length % 3).zero? }
# => {true=>5, false=>1}

p cities.each_count(:values)
# => Error: does not respond to given method

p cities.each_count(:length) {|city| city.length % 3 == 0}
# => Error: both method and block provided!
