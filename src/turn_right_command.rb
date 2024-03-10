require_relative 'command'
class TurnRightCommand < Command
  def execute
    @receiver.turn_right
  end
end