# frozen_string_literal: true

def find_fibonacci_index_by_length(digits)
  last_numbers = [1, 0]
  minimum = 10 ** (digits - 1)
  index = 1
  loop do
    fib_number = last_numbers.last + last_numbers.first
    return index if fib_number >= minimum
    last_numbers.shift
    last_numbers.push fib_number
    index += 1
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
