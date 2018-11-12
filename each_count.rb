class Array

  def each_count(method = nil, *params)

    if method == nil && block_given? == false
      hash = self.reduce(Hash.new(0)) { |key, value| key[value] += 1; key }
      hash
    elsif method != nil && block_given? == false
      method_hash = self.map do |element|
        if element.respond_to?(method)
          element.send(method, *params)
        else
          return "Error: does not respond to provided method"
        end
      end
      method_hash.each_count
    elsif method == nil && block_given?
      block_hash = self.map { |element| yield element } .each_count
      block_hash
    elsif method != nil && block_given?
      "Error: both method and block provided!"
    end

  end

end

cities = ["Melbourne", "Dallas", "Taipei", "Toronto", "Dallas", "Kathmandu"]

p cities.each_count
# => {"Melbourne"=>1, "Dallas"=>2, "Taipei"=>1, "Toronto"=>1, "Kathmandu"=>1}

p cities.each_count(:length)
# => {9=>2, 6=>3, 7=>1}

p cities.each_count(:gsub, /[aeiou]/, 'x')
# => {"Mxlbxxrnx"=>1, "Dxllxs"=>2, "Txxpxx"=>1, "Txrxntx"=>1, "Kxthmxndx"=>1}

p cities.each_count {|city| city.length % 3 == 0}
# => {true=>5, false=>1}

p cities.each_count(:values)
# => Error: does not respond to provided method

p cities.each_count(:length) {|city| city.length % 3 == 0}
# => Error: both method and block provided!
