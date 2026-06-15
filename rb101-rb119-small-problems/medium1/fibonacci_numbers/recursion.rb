# frozen_string_literal: true

def fibonacci(target, last_sequence = [0, 1], iteration = 2)
  return 1 if target == 1
  return last_sequence.sum if target == iteration
  fibonacci(target, [last_sequence.last, last_sequence.sum], iteration.next)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
