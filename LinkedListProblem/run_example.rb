
require_relative './linked_list'

# Example of the linked list running.
module LinkedListProblem

  list = LinkedList.new
  input = [5, 4, 3, 2, 1]

  input.each do |t|
    list.append t
  end

  print "Created a linked list with the following values: #{input}\n"

  print "Showing the kth to last element for each element:\n"
  7.times do |t|
    print "\t #{t}-to-last element: #{list.k_to_last_element t}\n"
  end
end