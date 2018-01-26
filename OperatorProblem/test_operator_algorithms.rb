require_relative './operator_algorithms'
require 'test/unit'

module OperatorProblem
  class TestOperatorAlgorithms < Test::Unit::TestCase

    # There should be 11 answers to this problem.
    def test_find_operators
      assert_equal 11, OperatorAlgorithms.find_operators([*1..9], 100).length
    end

    def test_do_operation
      assert_equal 10, OperatorAlgorithms.do_operation('+', [1, 0], 0)
      assert_equal 10, OperatorAlgorithms.do_operation('-', [1, 0], 20)
    end

    def test_merge_operators_with_numbers
      assert_equal [1, 0, '+', 5], OperatorAlgorithms.merge_operators_with_numbers(['', '+'], [1, 0, 5])
    end

    def test_num_arr_to_int
      assert_equal 567, OperatorAlgorithms.num_arr_to_int([5, 6, 7])
    end

    def test_value_with_operators
      numbers = [*1..9]
      operators = ['-', '+', '', '', '+', '+', '-', '']
      assert_equal 268, OperatorAlgorithms.value_with_operators(operators, numbers)
    end
  end
end