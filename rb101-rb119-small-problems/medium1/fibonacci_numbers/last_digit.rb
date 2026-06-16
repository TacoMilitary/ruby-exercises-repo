# frozen_string_literal: true

require 'benchmark'

def fibonacci(n)
  (3..n).reduce([1, 1]) { |f| [f[-1], f.sum] }.last
end

def fibonacci_last(n)
  fn = fibonacci n
  # fn.digits.first
  fn.to_s[-1].to_i
  # fn % 10
end

p fibonacci_last(15)        == 0 # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        == 5 # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       == 5 # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   == 1 # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) == 4 # -> 4
