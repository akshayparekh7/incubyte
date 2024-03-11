require_relative 'command'
# This class is responsible for moving the Space craft one point ahead in the current facing direction
class MoveForwardCommand < Command
  def execute
    @receiver.move_forward(@current_direction)
  end
end