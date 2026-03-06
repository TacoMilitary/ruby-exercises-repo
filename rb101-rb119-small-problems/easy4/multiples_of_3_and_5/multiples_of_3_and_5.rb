# frozen_string_literal: true

def multisum(max)
  multiples = []
  1.upto(max) do |n|
    is_multiple = n.modulo(3).zero? || n.modulo(5).zero?
    multiples << n if is_multiple
  end

  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
p multisum(20) == 98
