# frozen_string_literal: true

=begin
def fibonacci(target)
  f = [1, 1]
  3.upto(target) { f[-2], f[-1] = f[-1], f.sum }
  f[-1]
end
=end

=begin
def fibonacci(target)
  return target if '01'[target.to_s]
  second_last_n = 0
  (2..target).reduce(1) do |last_n, _|
    n = second_last_n + last_n
    second_last_n = last_n
    n
  end
end
=end

def fibonacci(n)
  (3..n).reduce([1, 1]) { |f| [f[-1], f.sum] }.last
end

p fibonacci(3) == 2
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
