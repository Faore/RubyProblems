
require_relative './operator_algorithms'

module OperatorProblem
  numbers = [*1..9]
  target = 100

  print "Running the operator algorithm with numbers #{numbers} and target sum #{target}.\n"
  solution = OperatorAlgorithms.find_operators numbers, target
  print "There were #{solution.length} solutions:\n"
  solution.each do |s|
    print("\t#{OperatorAlgorithms.solution_to_s s, numbers}\n")
  end
end