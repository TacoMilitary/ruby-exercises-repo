# frozen_string_literal: true

def sequence(upto_number)
  return [0] if upto_number.zero?
  upto_number.positive? ? (*1..upto_number) : (*upto_number..-1).reverse
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == [0]
p sequence(-1) == [-1]
p sequence(-6) == [-1, -2, -3, -4, -5, -6]
