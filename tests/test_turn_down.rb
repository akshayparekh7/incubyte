require 'minitest/autorun'
require_relative '../src/turn_down_command'
require_relative '../src/direction'

class TurnDownCommandTest < Minitest::Test
  def setup
    @direction = Direction.new('N')
    @command = TurnDownCommand.new(@direction)
  end

  def test_initialize
    assert_equal @direction, @command.instance_variable_get(:@receiver)
  end

  def test_execute_turns_down
    @command.execute
    assert_equal 'Down', @direction.facing
  end
end
