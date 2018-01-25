# Binary Tree Problem
Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is
defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.

## Solution
This solution is intended to run on Ruby 2.4.3 but should run on 2.3 and up. It takes advantage of the safe navigation
operator. The solution for the implements the `BinaryTree` and `BinaryTreeNode` classes in `binary_tree.rb`. The node
class has a method called `height` that recursively calculated its own height from its children nodes. This height
method is used for calculating whether or not a node is balanced in the `balanced?` method.

## Running the Examples and Unit Tests
`run_example.rb` contains a couple of examples of the tree. You can run it with:

```bash
ruby run_example.rb
```

`test_binary_tree.rb` contains unit tests for the tree class. You can run it with:
```bash
ruby test_binary_tree.rb
```
