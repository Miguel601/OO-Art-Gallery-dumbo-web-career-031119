require_relative '../config/environment.rb'

prince = Artist.new("Prince", 100)
ashley = Artist.new("Ashley", 1)
whitney = Gallery.new("Whitney", "New York")
moma = Gallery.new("MoMA", "New York")

painting1 = Painting.new("A New Life", 2, moma, prince)
painting2 = Painting.new("Hello World", 25, whitney, ashley)
painting3 = Painting.new("Goodbye Woooooooorld, A Memoir", 10, whitney, prince)

binding.pry

puts "Bob Ross rules."
