# Solution 1
# def each_with_index(array)
#   index = 0
# 
#   array.each do |element|
#     yield(element, index)
#     index += 1
#   end
# 
#   array
# end

# Solution 2
def each_with_index(array)
  array.size.times { |index| yield(array[index], index) }
  array
end

# Solution 3
# def each_with_index(array)
#   index = 0
# 
#   until index >= array.size
#     yield(array[index], index)
#     index += 1
#   end
# 
#   array
# end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# => 0 -> 1
# => 1 -> 3
# => 2 -> 36
# => true
