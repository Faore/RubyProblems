# frozen_string_literal: true
module OperatorProblem
  class OperatorAlgorithms
    OPERATORS = ['+', '-', ''].freeze

    def self.find_operators(numbers, target_answer)
      find_operators_recursive([], numbers, target_answer)
    end

    def self.find_operators_recursive(existing_operators, numbers, target_answer)
      # Base case: All the operators have been populated.
      if numbers.length - existing_operators.length == 1
        if value_with_operators(existing_operators, numbers) == target_answer
          return [existing_operators]
        else
          return nil
        end
      end
      # Divide and conquer.
      solutions = []
      OPERATORS.each do |op|
        sols = find_operators_recursive(existing_operators + [op], numbers, target_answer)
        solutions += sols unless sols.nil?
      end
      return solutions unless solutions.empty?
    end

    def self.value_with_operators(operators, numbers)
      throw ArgumentError if numbers.length - operators.length != 1
      numbers_with_operators = merge_operators_with_numbers operators, numbers
      number_buffer = []
      sum = 0
      # Always start out with the + operator to "add" the first item to the initial sum of 0.
      prev_operator = '+'
      numbers_with_operators.each do |t|
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
      # Theres going to be a left over number in the buffer that hasn't
      # been added or subtracted yet. Deal with it and return the sum.
      sum = do_operation prev_operator, number_buffer, sum
      sum
    end

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

    def self.do_operation(op, number, sum)
      sum += num_arr_to_int(number) if op == '+'
      sum -= num_arr_to_int(number) if op == '-'
      sum
    end

    def self.num_arr_to_int(buffer)
      buffer.inject { |a, i| a * 10 + i }
    end

    def self.solution_to_s(operators, numbers)
      numbers_with_operators = merge_operators_with_numbers operators, numbers
      numbers_with_operators.join
    end
  end
end