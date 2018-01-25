
require_relative './linked_list'
require 'test/unit'

module LinkedListProblem

  # Test for the LinkedList class.
  class TestLinkedList < Test::Unit::TestCase

    # Test creating and traversing the linked list.
    def test_linked_list
      list = LinkedList.new
      input = [*1..5]
      input.each do |t|
        list.append t
      end
      output =  Array.new
      current = list.head
      5.times do
        output.push current.value
        current = current.next_node
      end
      assert_equal input, output
    end

    # Test the k to last element algorithm.
    def test_k_to_last_element
      list = LinkedList.new
      input = [*1..5]
      input.each do |t|
        list.append t
      end

      # The first to last element should be 5, the last element.
      assert_equal 5, list.k_to_last_element(1)
      # The second to last element should be 4.
      assert_equal 4, list.k_to_last_element(2)
      # The 3rd to last element should be 3.
      assert_equal 3, list.k_to_last_element(3)
      # There is no 6th to last element.
      assert_equal nil, list.k_to_last_element(6)
      # There is no 0th to last element.
      assert_equal nil, list.k_to_last_element(0)
    end
  end
end