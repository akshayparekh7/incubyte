require 'minitest/autorun'
require_relative '../src/command'

class CommandTest < Minitest::Test
  def setup
    @receiver = Object.new
    @command = Command.new(@receiver)
  end

  def test_initialize
    assert_equal @receiver, @command.instance_variable_get(:@receiver)
  end

  def test_execute_raises_not_implemented_error
    assert_raises(NotImplementedError) { @command.execute }
  end
end
