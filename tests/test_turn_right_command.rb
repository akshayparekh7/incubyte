require 'minitest/autorun'
require_relative '../src/turn_right_command'
require_relative '../src/direction'

class TurnRightCommandTest < Minitest::Test
  def setup
    @direction = Direction.new('N')
    @command = TurnRightCommand.new(@direction)
  end

  def test_initialize
    assert_equal @direction, @command.instance_variable_get(:@receiver)
  end

  def test_execute_turn_right
    @command.execute
    assert_equal 'E', @direction.facing
  end
end
