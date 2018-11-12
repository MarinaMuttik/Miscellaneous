class Array
  def each_count(method = nil, *args)

    if method.nil? && block_given? == false
      each_with_object(Hash.new(0)) { |key, value| value[key] += 1 }
    elsif method && block_given? == false
      map do |element|
        return 'Error: does not respond to provided method' if element.respond_to?(method) == false
        element.send(method, *args)
        end
      .each_count
    elsif method.nil? && block_given?
      map { |element| yield element } .each_count
    elsif method && block_given?
      'Error: both method and block provided!'
    end
  end
end

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
# => Error: does not respond to provided method

p cities.each_count(:length) {|city| city.length % 3 == 0}
# => Error: both method and block provided!
