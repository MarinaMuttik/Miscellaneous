require 'pstore'
data = PStore.new("filename.pstore")

data.transaction do
  data [ "cats" ] = [ "tigga", "tizzy", "taffy" ]

  data.commit
end

data.transaction do
  data [ "cats" ] << [ "teddy" ]

  data.commit
end

data.transaction do
  data[ "cats" ]
end

cats = data.transaction { data[ "cats" ] }
puts cats
