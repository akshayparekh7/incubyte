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
    @position.move('N')
    assert_equal 0, @position.x
    assert_equal 1, @position.y
    assert_equal 0, @position.z
  end

  def test_move_south
    @position.move('S')
    assert_equal 0, @position.x
    assert_equal(-1, @position.y)
    assert_equal 0, @position.z
  end

  def test_move_east
    @position.move('E')
    assert_equal 1, @position.x
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end

  def test_move_west
    @position.move('W')
    assert_equal(-1, @position.x)
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end

  def test_move_up
    @position.move('Up')
    assert_equal 0, @position.x
    assert_equal 0, @position.y
    assert_equal 1, @position.z
  end

  def test_move_down
    @position.move('Down')
    assert_equal 0, @position.x
    assert_equal 0, @position.y
    assert_equal(-1, @position.z)
  end

  def test_move_invalid_direction
    @position.move('Invalid')
    assert_equal 0, @position.x
    assert_equal 0, @position.y
    assert_equal 0, @position.z
  end

  def test_multiple_positions
    @position.move('N')
    # Position should now be [0,1,0]
    @position.move('Up')
    # Position should now be [0,1,1]
    @position.move('E')
    # Position should now be [1,1,1]
    @position.move('Down')
    # Position should now be [1,1,0]
    @position.move('Down')
    # Position should now be [1,1,-1]
    assert_equal 1, @position.x
    assert_equal 1, @position.y
    assert_equal(-1, @position.z)
  end
end
