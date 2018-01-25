
require_relative './binary_tree'

module BinaryTreeProblem

  tree = BinaryTree.new 1
  tree.root.add_left_child 2
  tree.root.add_right_child 3
  print "Created example tree with following structure:\n"
  print tree
  print "This tree has a height of #{tree.height} and is #{tree.balanced? ? 'balanced' : 'unbalanced'}.\n\n"

  tree = BinaryTree.new 1
  tree.root.add_left_child 2
  tree.root.add_right_child 3
  tree.root.right_child.add_right_child 4
  tree.root.right_child.right_child.add_right_child 5
  print "Created example tree with following structure:\n"
  print tree
  print "This tree has a height of #{tree.height} and is #{tree.balanced? ? 'balanced' : 'unbalanced'}.\n\n"

end