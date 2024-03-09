# This class is responsible for maintaining the direction of the space craft
class Direction
  TURN_LEFT_MAP = { 'N' => 'W', 'W' => 'S', 'S' => 'E', 'E' => 'N' }.freeze
  TURN_RIGHT_MAP = TURN_LEFT_MAP.invert.freeze

  attr_reader :facing

  def initialize(facing)
    @facing = facing
  end

  def turn_left
    @facing = TURN_LEFT_MAP[@facing] || @facing
  end

  def turn_right
    @facing = TURN_RIGHT_MAP[@facing] || @facing
  end

  def turn_up
    @facing = 'Up'
  end

  def turn_down
    @facing = 'Down'
  end
end