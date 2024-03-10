require_relative 'command'
# This class is responsible for moving the Space craft one point ahead in the current facing direction
class MoveCommand < Command
  def initialize(receiver, direction)
    super(receiver)
    @direction = direction
  end

  def execute
    @receiver.move(@direction)
  end
end