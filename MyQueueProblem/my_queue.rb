require_relative './stack'

module MyQueueProblem
  class MyQueue
    @storage_stack
    @helper_stack

    def initialize
      @storage_stack = Stack.new
      @helper_stack = Stack.new
    end

    def push(x)
      # We need to get the new value to the bottom of the storage stack.
      # First move the entire storage stack into the helper stack.
      until @storage_stack.empty?
        @helper_stack.push @storage_stack.pop
      end
      # Now that the storage stack is empty. Put this at the bottom.
      @storage_stack.push x
      # Put everything in the helper stack back on top of the new item.
      until @helper_stack.empty?
        @storage_stack.push @helper_stack.pop
      end
    end

    def pop
      @storage_stack.pop
    end

    def peek
      @storage_stack.peek
    end

    def empty?
      @storage_stack.empty?
    end
  end
end