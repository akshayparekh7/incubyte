require 'minitest/autorun'
require_relative '../src/move_backward_command'
require_relative '../src/position'

class MoveBackwardCommandTest < Minitest::Test
  def setup
    @position = Position.new(0, 0, 0)
    @receiver = @position
    @command = MoveBackwardCommand.new(@receiver, 'N')
  end

  def test_initialize
    assert_equal @receiver, @command.instance_variable_get(:@receiver)
    assert_equal 'N', @command.instance_variable_get(:@current_direction)
  end

  def test_execute_moves_backward
    @command.execute
    assert_equal 0, @position.x
    assert_equal -1, @position.y
    assert_equal 0, @position.z
  end
end
