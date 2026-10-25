def integers(*ints)
  return nil if ints.any? { _1.negative? || _1.digits.size > 1 }

  number_sets = [ints.join.to_i.next.digits, ints.reverse]
  biggest_set = number_sets.max_by &:size
  biggest_set.map.with_index { |int, idx| number_sets.first[idx] || int  }.reverse
end

puts integers(4, 3, 2, 5) == [4, 3, 2, 6]
puts integers(1, 2, 3, 9) == [1, 2, 4, 0]
puts integers(9, 9, 9, 9) == [1, 0, 0, 0, 0]
puts integers(0, 1, 3, 7) == [0, 1, 3, 8]

# Take apart the number into digits.
# Adds the digits into the real number and add 0.
# Take it apart back into digits.
# Set the new array to the biggest number.
# Replace its digits with the digits of the new number.
# Return that new array.