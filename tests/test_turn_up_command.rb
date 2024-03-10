require 'minitest/autorun'
require_relative '../src/turn_up_command'
require_relative '../src/direction'

class TurnUpCommandTest < Minitest::Test
  def setup
    @direction = Direction.new('N')
    @command = TurnUpCommand.new(@direction)
  end

  def test_initialize
    assert_equal @direction, @command.instance_variable_get(:@receiver)
  end

  def test_execute_turn_up
    @command.execute
    assert_equal 'Up', @direction.facing
  end
end
