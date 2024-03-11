require_relative 'command'
# This class is responsible for moving the Space craft one point back in the current facing direction
class MoveBackwardCommand < Command
  def execute
    @receiver.move_backward(@current_direction)
  end
end