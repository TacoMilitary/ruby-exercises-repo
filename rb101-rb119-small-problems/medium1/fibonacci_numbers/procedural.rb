# frozen_string_literal: true

SQRT5 = Math.sqrt(5)
SQRT5_PLUS = SQRT5 + 1
SQRT5_MINUS = 1 - SQRT5
GOLDEN_RATIO = SQRT5_PLUS / 2.0

def fibonacci(n)
  sequence = [0, 1]
  (1..n).reduce(0) do |iteration|

  end
end

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
