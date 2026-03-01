# frozen_string_literal: true

def multiply(multiplicand, multiplier)
  multiplicand * multiplier
end

def square(number)
  multiply(number, number)
end

puts square(5) == 25
puts square(-8) == 64
