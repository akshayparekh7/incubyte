require 'minitest/autorun'
require_relative '../src/move_command'
require_relative '../src/position'

class MoveCommandTest < Minitest::Test
  def setup
    @position = Position.new(0, 0, 0)
    @receiver = @position
    @command = MoveCommand.new(@receiver, 'N')
  end

  def test_initialize
    assert_equal @receiver, @command.instance_variable_get(:@receiver)
    assert_equal 'N', @command.instance_variable_get(:@direction)
  end

  def test_execute_moves_forward
    @command.execute
    assert_equal 0, @position.x
    assert_equal 1, @position.y
    assert_equal 0, @position.z
  end

  def test_execute_moves_backward
    command = MoveCommand.new(@receiver, 'S')
    command.execute
    assert_equal 0, @position.x
    assert_equal -1, @position.y
    assert_equal 0, @position.z
  end

  def test_execute_moves_east
    command = MoveCommand.new(@receiver, 'E')
    command.execute
    assert_equal 1, @position.x
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end
end
