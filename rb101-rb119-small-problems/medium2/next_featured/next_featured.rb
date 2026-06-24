# frozen_string_literal: true

def odd_multiple(number, multiple_of = 7)
  number.odd? && (number % multiple_of).zero?
end

def featured?(number)
  odd_multiple(number) && !number.digits.uniq!
end

# Solution 2
=begin
def featured(number)
  number += 1
  number += 1 until odd_multiple(number)
  loop do
    return nil if number.digits.size > 10
    return number if featured?(number)
    number += 14
  end
end
=end

# Solution 1
def featured(number)
  loop do
    return nil if number.digits.size > 10
    number += 1
    return number if featured?(number)
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
p featured(999_999_987) == 1_023_456_987
