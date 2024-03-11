require_relative 'turn_left_command'
require_relative 'turn_right_command'
require_relative 'turn_down_command'
require_relative 'turn_up_command'
require_relative 'move_forward_command'
require_relative 'move_backward_command'
require_relative 'position'
require_relative 'direction'
class Spacecraft
  attr_reader :position, :direction, :commands

  def initialize(position_input, direction_input, commands_input)
    x, y, z = position_input
    @position = Position.new(x,y,z)
    @direction = Direction.new(direction_input)
    @commands = commands_input.map { |c| command_mapper[c.downcase] }
  end

  def call
    @commands.each(&:call)
    puts "Final Position: (#{@position.x}, #{@position.y}, #{@position.z})"
    puts "Final direction: #{direction.facing}"
  end

  def command_mapper
    {
      'f' => -> { MoveForwardCommand.new(@position, @direction.facing).execute },
      'b' => -> { MoveBackwardCommand.new(@position, @direction.facing).execute },
      'l' => -> { TurnLeftCommand.new(@direction).execute },
      'r' => -> { TurnRightCommand.new(@direction).execute },
      'u' => -> { TurnUpCommand.new(@direction).execute },
      'd' => -> { TurnDownCommand.new(@direction).execute }
    }
  end
end