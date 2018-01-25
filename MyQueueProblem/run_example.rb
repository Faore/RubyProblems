require_relative './my_queue'

module MyQueueProblem
  queue = MyQueue.new
  input = [1,2,3,4,5]
  input.each do |t|
    queue.push t
  end
  print "Created a queue and added the following elements: #{input}\n"
  print "Peeking at the first item in the queue yields: #{queue.peek}\n"
  print "Popping each item in the queue:\n"
  until queue.empty?
    print "\tPopped #{queue.pop}\n"
  end
end