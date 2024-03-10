require_relative 'command'
class TurnLeftCommand < Command
  def execute
    @receiver.turn_left
  end
end