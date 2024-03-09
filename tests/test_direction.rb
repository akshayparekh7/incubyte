require 'minitest/autorun'
require_relative '../src/direction'

class DirectionTest < Minitest::Test
  def setup
    @direction = Direction.new('N')
  end

  def test_turn_left_map
    assert_equal({ 'N' => 'W', 'W' => 'S', 'S' => 'E', 'E' => 'N' }, Direction::TURN_LEFT_MAP)
  end

  def test_turn_right_map
    assert_equal({ 'W' => 'N', 'S' => 'W', 'E' => 'S', 'N' => 'E' }, Direction::TURN_RIGHT_MAP)
  end

  def test_initial_facing
    assert_equal 'N', @direction.facing
  end

  def test_turn_left_from_north
    @direction.turn_left
    assert_equal 'W', @direction.facing
  end

  def test_turn_left_from_west
    @direction = Direction.new('W')
    @direction.turn_left
    assert_equal 'S', @direction.facing
  end

  def test_turn_left_from_south
    @direction = Direction.new('S')
    @direction.turn_left
    assert_equal 'E', @direction.facing
  end

  def test_turn_left_from_east
    @direction = Direction.new('E')
    @direction.turn_left
    assert_equal 'N', @direction.facing
  end

  def test_turn_right_from_north
    @direction.turn_right
    assert_equal 'E', @direction.facing
  end

  def test_turn_right_from_west
    @direction = Direction.new('W')
    @direction.turn_right
    assert_equal 'N', @direction.facing
  end

  def test_turn_right_from_south
    @direction = Direction.new('S')
    @direction.turn_right
    assert_equal 'W', @direction.facing
  end

  def test_turn_right_from_east
    @direction = Direction.new('E')
    @direction.turn_right
    assert_equal 'S', @direction.facing
  end

  def test_turn_up
    @direction.turn_up
    assert_equal 'Up', @direction.facing
  end

  def test_turn_down
    @direction.turn_down
    assert_equal 'Down', @direction.facing
  end
end
