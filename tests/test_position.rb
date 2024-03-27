require 'minitest/autorun'
require_relative '../src/position'
class PositionTest < Minitest::Test
  def setup
    @position = Position.new(0, 0, 0, [0,0,0], [10,10,10])
  end

  def test_initialize
    assert_equal [0,0,0], @position.instance_variable_get(:@lower_limit_coordinates)
    assert_equal [10,10,10], @position.instance_variable_get(:@upper_limit_coordinates)
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

  def test_forward_x_coordinate_under_range
    position = Position.new(1,1,1)
    assert_equal true, position.move_forward('E')
  end

  def test_forward_x_coordinate_beyond_range
    position = Position.new(10,10,10)
    assert_raises(StandardError) { position.move_forward('E') }
  end

  def test_forward_y_coordinate_under_range
    position = Position.new(1,1,1)
    assert_equal true, position.move_forward('N')
  end

  def test_forward_y_coordinate_beyond_range
    position = Position.new(0,10,0)
    assert_raises(StandardError) { position.move_forward('N') }
  end

  def test_forward_z_coordinate_under_range
    position = Position.new(1,1,1)
    assert_equal true, position.move_forward('Up')
  end

  def test_forward_z_coordinate_beyond_range
    position = Position.new(0,10,10)
    assert_raises(StandardError) { position.move_forward('Up') }
  end

  def test_backward_x_coordinate_under_range
    position = Position.new(1,1,1)
    assert_equal true, position.move_backward('E')
  end

  def test_backward_x_coordinate_beyond_range
    position = Position.new(0,10,10)
    assert_raises(StandardError) { position.move_backward('E') }
  end

  def test_backward_y_coordinate_under_range
    position = Position.new(1,1,1)
    assert_equal true, position.move_backward('N')
  end

  def test_backward_y_coordinate_beyond_range
    position = Position.new(0,0,0)
    assert_raises(StandardError) { position.move_backward('N') }
  end

  def test_backward_z_coordinate_under_range
    position = Position.new(1,1,1)
    assert_equal true, position.move_backward('Up')
  end

  def test_backward_z_coordinate_beyond_range
    position = Position.new(0,10,0)
    assert_raises(StandardError) { position.move_backward('Up') }
  end

  def test_raises_error_beyond_boundary
    position = Position.new(10,10,10)
    assert_raises(StandardError) { position.validate(11,10,11) }
  end

  def test_validate_within_boundary
    position = Position.new(1,1,1)
    assert_equal true, position.validate(1,1,1)
  end
end
