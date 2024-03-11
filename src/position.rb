# This class is responsible for maintaining the current position of the Space aircraft and move it as per the direction
class Position
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
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
  end

  def move_backward(direction)
    movement = BACKWARD_MOVEMENTS[direction]
    return unless movement

    @x -= movement[:x]
    @y -= movement[:y]
    @z -= movement[:z]
  end
end
