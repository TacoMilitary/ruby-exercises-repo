# frozen_string_literal: true

def multiply(multiplicand, multiplier)
  multiplicand * multiplier
end

def pow(number, power = 2)
  result = number
  (power - 1).times { result = multiply(number, number) }
  
  result
end

def smart_pow(number, power = 2)
  ([number] * power).reduce(:*)
end

puts smart_pow(4, 2)
puts pow(4, 2)
