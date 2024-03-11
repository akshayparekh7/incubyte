# Base class for all the different types of command. 
# receiver is the object of the class which will be responsible for the action
class Command
  def initialize(receiver, current_direction='')
    @receiver = receiver
    @current_direction = current_direction
  end

  def execute
    raise NotImplementedError
  end
end