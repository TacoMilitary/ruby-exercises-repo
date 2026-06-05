# frozen_string_literal: true

def sequence(upto_number)
  upto_number = 1 unless upto_number > 0
  (1..upto_number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
