
# frozen_string_literal: true
#
module OperatorProblem

  # Class to contain all the methods associated with finding the solutions for the operator problem.
  class OperatorAlgorithms
    OPERATORS = ['+', '-', ''].freeze

    # Entry point for the algorithm.
    def self.find_operators(numbers, target_answer)
      find_operators_recursive([], numbers, target_answer)
    end

    # Recursively find all the solutions and return it.
    def self.find_operators_recursive(existing_operators, numbers, target_answer)
      # Base case: All the operators have been populated.
      if numbers.length - existing_operators.length == 1
        # If this combination is a solution lets return it in an array.
        # If not, don't return anything.
        if value_with_operators(existing_operators, numbers) == target_answer
          return [existing_operators]
        else
          return nil
        end
      end
      # Divide and conquer.
      solutions = []
      # Call this method again after adding each operator to our operators.
      # If there are any solutions, we add them to our solution.
      OPERATORS.each do |op|
        sols = find_operators_recursive(existing_operators + [op], numbers, target_answer)
        solutions += sols unless sols.nil?
      end
      # Don't return anything if there wasn't a solution.
      return solutions unless solutions.empty?
    end

    # Calculates the value of an expression.
    def self.value_with_operators(operators, numbers)
      # There should be exactly n - 1 operators present if there are n numbers.
      throw ArgumentError if numbers.length - operators.length != 1
      # merge the operators and numbers into a
      # single array to easily iterate over them.
      numbers_with_operators = merge_operators_with_numbers operators, numbers
      number_buffer = []
      sum = 0
      # Always start out with the + operator to "add"
      # the first item to the initial sum of 0.
      prev_operator = '+'
      numbers_with_operators.each do |t|
        # If this item is a number and not an operator,
        # we add it to the number buffer.
        if t.is_a? Integer
          number_buffer.push t
        else
          # Take everything in the buffer and convert it to an integer, and
          # perform the operation associated with prev_operator.
          sum = do_operation prev_operator, number_buffer, sum
          number_buffer = []
          prev_operator = t
        end
      end
      # There's going to be a left over number in the buffer that hasn't
      # been added or subtracted yet. Deal with it and return the sum.
      sum = do_operation prev_operator, number_buffer, sum
      sum
    end

    # Merge the operator and numbers into a single array in order.
    def self.merge_operators_with_numbers(operators, numbers)
      numbers_with_operators = []
      numbers.length.times do |i|
        numbers_with_operators.push numbers[i]
        if i < operators.length && operators[i] != ''
          numbers_with_operators.push operators[i]
        end
      end
      numbers_with_operators
    end

    # Perform an operation on an array of digits given the sum and an operator.
    def self.do_operation(op, number, sum)
      sum += num_arr_to_int(number) if op == '+'
      sum -= num_arr_to_int(number) if op == '-'
      sum
    end

    # Convert an array of digits to an integer.
    def self.num_arr_to_int(buffer)
      buffer.inject { |a, i| a * 10 + i }
    end

    # Create a string out of the operators and numbers for displaying the solution.
    def self.solution_to_s(operators, numbers)
      numbers_with_operators = merge_operators_with_numbers operators, numbers
      numbers_with_operators.join
    end
  end
end