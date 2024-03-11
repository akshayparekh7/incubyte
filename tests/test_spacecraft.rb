require 'minitest/autorun'
require_relative '../src/spacecraft'

class SpacecraftTest < Minitest::Test
  def test_spacecraft_movement_forward
    position = [0, 0, 0]
    direction = 'N'
    commands = ['f']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(0, spacecraft.position.x)
    assert_equal(1, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('N', spacecraft.direction.facing)
  end

  def test_spacecraft_movement_backward
    position = [0, 0, 0]
    direction = 'N'
    commands = ['b']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(0, spacecraft.position.x)
    assert_equal(-1, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('N', spacecraft.direction.facing)
  end

  def test_spacecraft_movement_left
    position = [0, 0, 0]
    direction = 'N'
    commands = ['l']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(0, spacecraft.position.x)
    assert_equal(0, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('W', spacecraft.direction.facing)
  end

  def test_spacecraft_movement_right
    position = [0, 0, 0]
    direction = 'N'
    commands = ['r']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(0, spacecraft.position.x)
    assert_equal(0, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('E', spacecraft.direction.facing)
  end

  def test_spacecraft_movement_up
    position = [0, 0, 0]
    direction = 'N'
    commands = ['u']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(0, spacecraft.position.x)
    assert_equal(0, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('Up', spacecraft.direction.facing)
  end

  def test_spacecraft_movement_down
    position = [0, 0, 0]
    direction = 'N'
    commands = ['d']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(0, spacecraft.position.x)
    assert_equal(0, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('Down', spacecraft.direction.facing)
  end

  def test_spacecraft_with_multiple_commands
    position = [0, 0, 0]
    direction = 'N'
    commands = ['f', 'r', 'f', 'l', 'b', 'u']

    spacecraft = Spacecraft.new(position, direction, commands)
    spacecraft.call

    assert_equal(1, spacecraft.position.x)
    assert_equal(0, spacecraft.position.y)
    assert_equal(0, spacecraft.position.z)
    assert_equal('Up', spacecraft.direction.facing)
  end
end
