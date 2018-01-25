# MyQueue Problem
Implement a MyQueue class which implements a queue using two stacks.

## Solution
This solution was tested on Ruby 2.4.3 but should run on earlier versions. The solution implements a `Stack`
class and its associated `StackNode` in `stack.rb`. Only the `Stack` class is used in the solution for the `MyQueue` 
class. This class keeps track of two stacks: a `storage_stack` and a `helper_stack`. The storage stack maintains the
reversed contents of the queue such that when its `pop` or `peek` methods are called, they return the first item in the
queue. The helper stack is kept empty. It is only used when pushing to the queue to temporarily hold items from the
storage stack while a new item is added to the bottom of the storage stack.

## Running the Examples and Unit Tests
`run_example.rb` contains an example of the queue at work. You can run it with:

```bash
$ ruby run_example.rb
```

`test_binary_tree.rb` contains unit tests for both the queue and the stack. You can run them with:
```bash
$ ruby test_my_queue.rb
$ ruby test_stack.rb
```