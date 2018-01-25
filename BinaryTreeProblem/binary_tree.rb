module BinaryTreeProblem

  # Class for holding the nodes of the binary tree, and associated functions.
  class BinaryTree

    @root = nil

    attr_reader :root

    # This tree is initialized with one node.
    def initialize(x)
      @root = BinaryTreeNode.new x, nil
    end

    # Method to traverse tree to find out if it is.
    def balanced?
      @root.balanced?
    end

    # The height of the tree is just the height of the root node.
    def height
      @root.height
    end

    def to_s
      "Binary Tree:\n#{@root}"
    end
  end

  # Node class for the binary tree.
  class BinaryTreeNode
    @value = nil
    @parent = nil
    @left_child = nil
    @right_child = nil

    attr_accessor :value
    attr_reader :parent
    attr_reader :left_child
    attr_reader :right_child

    # Initialize the node
    def initialize(x, parent)
      @value = x
      @parent = parent
    end

    # Recursively find the height at this node.
    def height
      if left_child.nil? && right_child.nil?
        return 0
      end
      [left_child.nil? ? 0 : left_child.height, right_child.nil? ? 0 : right_child.height].max + 1
    end

    # Recursively find out if the subtrees are balanced.
    def balanced?
      # If a node doesn't exist then we check to see if its neighbor exists. If it does we make sure it has no children.
      # If this is the case this node is balanced. If not, it can't be balanced. If both nodes exist we compare
      # their heights. If they are within 1 of each other, we recursively check if they are balanced.
      if left_child.nil?
        if right_child.nil?
          return true
        else
          if right_child.height == 0
            return true
          else
            return false
          end
        end
      else
        if right_child.nil?
          if left_child.height == 0
            return true
          else
            return false
          end
        else
          if (right_child.height - left_child.height).between?(-1, 1)
            return left_child.balanced? && right_child.balanced?
          else
            return false
          end
        end
      end
    end

    def add_left_child(x)
      @left_child = BinaryTreeNode.new(x, self)
    end

    def add_right_child(x)
      @right_child = BinaryTreeNode.new(x, self)
    end

    def to_s
      "Node: #{@value}\n\tLeft Child: #{@left_child&.value}\n\tRight Child:#{@right_child&.value}\n#{@left_child}#{@right_child}"
    end
  end

end