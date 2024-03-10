require 'minitest/autorun'
require_relative '../src/turn_left_command'
require_relative '../src/direction'

class TurnLeftCommandTest < Minitest::Test
  def setup
    @direction = Direction.new('N')
    @command = TurnLeftCommand.new(@direction)
  end

  def test_initialize
    assert_equal @direction, @command.instance_variable_get(:@receiver)
  end

  def test_execute_turns_left
    @command.execute
    assert_equal 'W', @direction.facing
  end
end
