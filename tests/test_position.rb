require 'minitest/autorun'
require_relative '../src/position'
class PositionTest < Minitest::Test
  def setup
    @position = Position.new(0, 0, 0)
  end

  def test_initial_position
    assert_equal 0, @position.x
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end

  def test_move_north
    @position = Position.new(0, 0, 0)
    @position.move_forward('N')
    assert_equal 0, @position.x
    assert_equal 1, @position.y
    assert_equal 0, @position.z
  end

  def test_move_south
    @position = Position.new(0, 0, 0)
    @position.move_backward('S')
    assert_equal 0, @position.x
    assert_equal(-1, @position.y)
    assert_equal 0, @position.z
  end

  def test_move_east
    @position = Position.new(0, 0, 0)
    @position.move_forward('E')
    assert_equal 1, @position.x
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end

  def test_move_west
    @position = Position.new(0, 0, 0)
    @position.move_backward('W')
    assert_equal(-1, @position.x)
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end

  def test_move_up
    @position = Position.new(0, 0, 0)
    @position.move_forward('Up')
    assert_equal 0, @position.x
    assert_equal 0, @position.y
    assert_equal 1, @position.z
  end

  def test_move_down
    @position = Position.new(0, 0, 0)
    @position.move_backward('Down')
    assert_equal 0, @position.x
    assert_equal 0, @position.y
    assert_equal(-1, @position.z)
  end

  def test_multiple_positions
    @position = Position.new(0, 0, 0)
    @position.move_forward('N')
    # Position should now be [0,1,0]
    @position.move_forward('Up')
    # Position should now be [0,1,1]
    @position.move_forward('E')
    # Position should now be [1,1,1]
    @position.move_backward('Down')
    # Position should now be [1,1,0]
    @position.move_backward('Down')
    # Position should now be [1,1,-1]
    assert_equal 1, @position.x
    assert_equal 1, @position.y
    assert_equal(-1, @position.z)
  end
end
