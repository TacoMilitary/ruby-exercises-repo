def find_unknown_number(x,y,z)
  (1..).find { |n| (n % 3) == x && (n % 5) == y && (n % 7) == z }
end

# Given x, y, z.
# x = n % 3
# y = n % 5
# z = n % 7
# Find smallest possible (n).

# Example:
# x = 2, y = 3, z = 2
# n = 23

# xyz cannot be negative
# xyz must be below their modulo value

p find_unknown_number(2, 3, 2) == 23
p find_unknown_number(1, 2, 3) == 52
p find_unknown_number(1, 3, 5) == 103
p find_unknown_number(0, 0, 0) == 105
p find_unknown_number(1, 1, 1) == 1

# remainder:
# 52 / 3 = 17.333...
# Rounded down to 17.
# 17 (rounded) * 3 (divisor) = 51
# Difference between this nubmer and original is our remainder.
# Add 1 to get original 52.
# Added amount is our remainder.

# To get 52
(1..1000).select { |number| [3, 5, 7].any? { |d| (number % d).zero? } }
(1..1000).select { |number| (number % 3).zero? && (number % 7).zero?  }
# 51
# 50
# 49

# Only worked with 2.
# Find the lowest common multiple between the xyz value and xyz modulo value.
# Multiply this by the xyz modulo value.
# Add the xyz value.

# 103 / 7 = 14.714285...
# Rounded to 14 (quotient)
# 14 * 7 = 98 (remainder 5)
# 98 + 5 = 103
# Maybe we're missing a critical part of the equation.
# The relationship between x, y, and z.


# 2.lcm(3) = 6
# 3.lcm(5) = 15
# 2.lcm(7) = 14

# Literally all you have to do.
# Iterate over a range from 1 to infinity.
# Find the first number that when divided by the xyz modulo value
# is equal to the xyz value we got.
#(1..1000).select do |number|
#  (number % 3) == 2 &&
#  (number % 5) == 3 &&
#  (number % 7) == 2
#end