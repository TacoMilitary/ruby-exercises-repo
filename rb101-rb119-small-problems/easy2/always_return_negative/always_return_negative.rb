def negative(num)
  num.negative? ? num : num * -1
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0 