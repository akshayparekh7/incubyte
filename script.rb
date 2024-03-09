require 'json'

def validate(input)
  JSON.parse(input)
rescue JSON::ParserError => e
  puts 'Invalid input format. Please enter an array'
  exit
end

puts "Input the Commands array, for eg ->  ['f', 'b', 'l', 'r'] "
input = gets.chomp
commands = validate(input)

puts 'Input the starting position array, for eg -> [0,0,0]'
position_input = gets.chomp
position = validate(position_input)

puts commands
puts position
