# frozen_string_literal: true

def sum_square_difference(range)
  square_sum = 0
  num_sum = 0
  1.upto(range) do |n|
    square_sum += n**2
    num_sum += n
  end

  (square_sum - num_sum**2).abs
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
