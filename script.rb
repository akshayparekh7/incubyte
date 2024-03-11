require 'json'
require_relative 'src/spacecraft'

def convert_to_array(input)
  eval(input)
end

puts "Input the Commands array, for eg ->  ['f', 'r', 'u', 'b', 'l'] "
commands = gets.chomp

puts 'Input the starting position array, for eg -> [0,0,0]'
position_input = gets.chomp

puts 'Input the initial direction, for eg N'
direction = gets.chomp

Spacecraft.new(convert_to_array(position_input), direction, convert_to_array(commands)).call