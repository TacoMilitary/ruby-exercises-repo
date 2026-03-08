# frozen_string_literal: true

def double_number?(number)
  digits = number.digits
  middle_index = digits.length / 2 - 1

  digits[0..middle_index] == digits[(middle_index + 1)..-1]
end

def twice(number)
  return_number = number
  return_number *= 2 if number.digits.length.odd? || !double_number?(number)

  return_number
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
