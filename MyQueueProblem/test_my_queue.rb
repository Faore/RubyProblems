
require_relative './my_queue'
require 'test/unit'

module MyQueueProblem
  class TestMyQueue < Test::Unit::TestCase
    # Push 5 items to the queue, peek at the first one,
    # and pop the 5 items from the queue and ensure they are in order.
    def test_stack
      input = [1,2,3,4,5]
      queue = MyQueue.new

      input.each do |t|
        queue.push t
      end
      assert_equal(1, queue.peek)

      output = Array.new
      5.times do |i|
        output.push(queue.pop)
      end
      assert_equal(input, output)
    end
  end
end