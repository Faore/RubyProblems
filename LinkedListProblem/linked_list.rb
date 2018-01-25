
module LinkedListProblem

  # Implementation of a linked list with the algorithm for the solution.
  class LinkedList

    @head = nil
    @tail = nil

    attr_reader :head

    def append(x)
      if @head.nil?
        @head = LinkedListNode.new x
        @tail = @head
        return
      end

      @tail.attach_next_node LinkedListNode.new x
      @tail = @tail.next_node
    end

    # Implementation of the k to last element algorithm.
    def k_to_last_element(k)
      return nil if k.zero?
      # This can be accomplished by keeping a pointer at the kth element so far.
      # Start by traversing the list to the kth element.
      k_to_last = @head
      current = @head

      # Move current k - 1 elements forward so k_to_last is the kth element so
      # far. If we run into nil while doing this then there is no kth element
      # in the list and we can return nil.
      (k - 1).times do
        return nil if current.nil?
        current = current.next_node
      end
      return nil if current.nil?
      # Traverse the list to the end, and move both pointers together.
      until current.next_node.nil?
        k_to_last = k_to_last.next_node
        current = current.next_node
      end
      k_to_last.value
    end

  end

  # Simple node for the linked list.
  class LinkedListNode

    attr_accessor :value
    attr_reader :next_node

    def initialize(x)
      @value = x
      @next_node = nil
    end

    def attach_next_node(node)
      @next_node = node
    end
  end
end
