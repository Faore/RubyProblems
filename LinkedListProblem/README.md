# Singly Linked List Problem
Implement an algorithm to find the kth to last element of a singly linked list.
## Solution
This solution is intended to run on Ruby 2.4.3 but should run on earlier versions. The solution implements a
`LinkedList` class in `linked_list.rb`. It also contains the algorithm to find the kth to last element. For 
the purposes of this problem I defined the 1st to last element as the last element. There is no 0th to last 
element. The solution worked by keeping track of two pointers. It starts by setting the `k_to_last` to the
first element and moving the `current` point such that `k_to_last` is the kth to last element up to the
current pointer. It then moves the pointers together until the current pointer reaches the end of the list.

## Running the Examples and Unit Tests
`run_example.rb` contains an example of the algorithm on 2 invalid inputs and 5 valid ones. You can run it with:

```bash
ruby run_example.rb
```

`test_linked_list.rb` contains unit tests for all the functionality in `linked_list.rb`. You can run it with:
```bash
ruby test_linked_list.rb
```