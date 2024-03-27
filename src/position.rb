require 'debug'
# This class is responsible for maintaining the current position of the Space aircraft and move it as per the direction
class Position
  attr_reader :x, :y, :z, :lower_limit_coordinates, :upper_limit_coordinates

  def initialize(x, y, z, lower_limit_coordinates = [0, 0, 0], upper_limit_coordinates = [10, 10, 10])
    @x = x
    @y = y
    @z = z
    @lower_limit_coordinates = lower_limit_coordinates
    @upper_limit_coordinates = upper_limit_coordinates
  end

  FORWARD_MOVEMENTS = {
    'N' => { x: 0, y: 1, z: 0 },
    'S' => { x: 0, y: -1, z: 0 },
    'E' => { x: 1, y: 0, z: 0 },
    'W' => { x: -1, y: 0, z: 0 },
    'Up' => { x: 0, y: 0, z: 1 },
    'Down' => { x: 0, y: 0, z: -1 }
  }.freeze

  BACKWARD_MOVEMENTS = {
    'N' => { x: 0, y: 1, z: 0 },
    'S' => { x: 0, y: 1, z: 0 },
    'E' => { x: 1, y: 0, z: 0 },
    'W' => { x: 1, y: 0, z: 0 },
    'Up' => { x: 0, y: 0, z: 1 },
    'Down' => { x: 0, y: 0, z: 1 }
  }

  def move_forward(direction)
    movement = FORWARD_MOVEMENTS[direction]
    return unless movement

    @x += movement[:x]
    @y += movement[:y]
    @z += movement[:z]

    validate(@x, @y, @z)
  end

  def move_backward(direction)
    movement = BACKWARD_MOVEMENTS[direction]
    return unless movement

    @x -= movement[:x]
    @y -= movement[:y]
    @z -= movement[:z]

    validate(@x, @y, @z)
  end

  def validate(current_x, current_y, current_z)
    # Could optimise this much better, probably check in range but due to time constraint committing this
    unless lower_limit_coordinates[0] <= current_x && current_x <= upper_limit_coordinates[0] &&
           lower_limit_coordinates[1] <= current_y && current_y <= upper_limit_coordinates[1] &&
           lower_limit_coordinates[2] <= current_z && current_z <= upper_limit_coordinates[2]
      raise StandardError, 'Going beyond boundaries'
    end

    true
  end
end
