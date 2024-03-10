require_relative 'command'
class TurnUpCommand < Command
  def execute
    @receiver.turn_up
  end
end