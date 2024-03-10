require_relative 'command'
class TurnDownCommand < Command
  def execute
    @receiver.turn_down
  end
end