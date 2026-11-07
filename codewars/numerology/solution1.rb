require 'date'

def solution date
  digits = date.strftime('%-m%-d%-Y').chars.map(&:to_i)
  digits.reduce(0) do |output, digit|
    output = output + digit
    output.digits.size > 1 ? output.digits.sum : output
  end
end

puts solution(Date.new(1964, 10, 13))
# 10 13 1964
# 0 | 1 + 0 | 1
# 1 | 1 + 1 | 2
# 2 | 2 + 3 | 5
# 5 | 5 + 1 | 6
# 6 | 6 + 9 | 15
# 15 | 1 + 5 | 6
# 6 | 6 + 6 | 12
# 12 | 1 + 2 | 3
# 3 | 3 + 4 | 7

# Given date object.
# With format Month Date Year
# Add the sum of two digits, then the sum of its result two digits if over 9.
# Until we have a final sum.

# For each slice of two.
# If current sum has two digits.
# Add the sum of the two digits.
# Now add the two sliced digits.
# Return the final output.