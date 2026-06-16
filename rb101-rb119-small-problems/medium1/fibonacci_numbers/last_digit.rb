# frozen_string_literal: true

LAST_DIGITS = (3..60).reduce([0, 1, 1]) { |f| f << f[-2] + f[-1] }.map { |n| n % 10 }.freeze

def fibonacci_last(n)
  LAST_DIGITS[n % 60]
end

p fibonacci_last(15)        == 0 # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        == 5 # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       == 5 # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   == 1 # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) == 4 # -> 4
