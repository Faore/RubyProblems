
require_relative './binary_tree'
require 'test/unit'

module BinaryTreeProblem

  class TestBinaryTree < Test::Unit::TestCase

    # Test the construction of the binary tree.
    def test_construction
      tree = BinaryTree.new 1
      assert_equal 1, tree.root.value

      tree.root.add_left_child 2
      assert_equal 2, tree.root.left_child.value
      assert_same tree.root, tree.root.left_child.parent

      tree.root.add_right_child 3
      assert_equal 3, tree.root.right_child.value
      assert_same tree.root, tree.root.right_child.parent
    end

    # Test the functions for finding the height of the tree.
    def test_height
      tree = BinaryTree.new(1)
      tree.root.add_left_child 2
      tree.root.add_right_child 3
      assert_equal(1, tree.height)
      tree.root.right_child.add_left_child 4
      assert_equal(2, tree.height)
    end

    # Test the functions for finding out if the tree is balanced.
    def test_balanced
      tree = BinaryTree.new(1)
      tree.root.add_left_child 2
      tree.root.add_right_child 3
      assert_true(tree.balanced?)

      tree.root.left_child.add_left_child 4
      assert_true(tree.balanced?)
      tree.root.left_child.left_child.add_left_child 5
      assert_false(tree.balanced?)
      tree.root.right_child.add_right_child 6
      assert_false(tree.balanced?)
      tree.root.left_child.add_right_child 7
      assert_true(tree.balanced?)
      tree.root.right_child.right_child.add_right_child 8
      assert_false(tree.balanced?)
    end
  end
end