
require_relative './stack'
require 'test/unit'

module MyQueueProblem
  class TestStack < Test::Unit::TestCase
    # Push 5 items to the stack, peek at the last one,
    # and pop the 5 items from the stack and ensure they are reversed.
    def test_stack
      input = [1,2,3,4,5]
      stack = Stack.new

      input.each do |t|
        stack.push t
      end
      assert_equal(5, stack.peek)

      output = Array.new
      5.times do |i|
        output.push(stack.pop)
      end
      assert_equal(input.reverse, output)
    end
  end
end