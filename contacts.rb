require 'pstore'
data = PStore.new( "filename.pstore" )


run = true
while(run) do

puts "Please select a number option from below"
puts "1. Add a new contact"
puts "2. List all contacts"
puts "3. Retrieve a contact's birthday"
puts "4. Exit"

option = gets.to_i

  if option == 1
    puts "enter full name"
    name = gets.chomp.upcase
    puts "enter birthday (dd/mm/yy)"
    bday = gets.chomp
     data.transaction do
       data [ name ] ||= [ bday ]
       data.commit
     end

  elsif option == 2
    contactlist = data.transaction { " Contacts: #{ data[ bday ] } " }
    puts contactlist

  elsif option == 3
    bdaylist = data.transaction { " Bdays: #{ data[ name ]  } " }
    puts bdaylist

  elsif option == 4
    run = false

  else puts "error!"
  end

end
