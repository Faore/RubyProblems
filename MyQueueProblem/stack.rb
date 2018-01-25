module MyQueueProblem

  # The main stack implementation for the queue.
  class Stack
    @root = nil

    # Push a new item into the stack
    def push(x)
      if @root.nil?
        @root = StackNode.new x, nil
        return
      end
      @root = StackNode.new x, @root
    end

    # Pop the first item off the stack.
    def pop
      val = @root.value
      @root = @root.next_node
      val
    end

    # Peek at the first item.
    def peek
      @root.value
    end

    # Returns whether or not the stack is empty.
    def empty?
      @root.nil?
    end
  end

  class StackNode
    @next_node = nil
    @value = nil

    attr_reader :next_node
    attr_accessor :value

    # The node keeps track of the node that will replace it if it is popped, and the value.
    def initialize(x, next_node)
      @value = x
      @next_node = next_node
    end
  end
end