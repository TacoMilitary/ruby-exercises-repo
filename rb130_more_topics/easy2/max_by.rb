# iterate over the array
# record the highest value and their element
# cache the current element value by block
# use #<=> to compare the values

# Solution 1
# def max_by(array)
#   highest_element = nil
#   highest_value = nil
# 
#   array.each do |element|
#     block_value = yield(element)
#     next unless highest_value.nil? || (block_value <=> highest_value) == 1
# 
#     highest_element = element
#     highest_value = block_value
#   end
# 
#   highest_element
# end

# Solution 2
def max_by(array)
  array.each_with_object({ element: nil, value: nil }) do |element, max|
    block_value = yield(element)
    next unless max[:value].nil? || (block_value <=> max[:value]) == 1

    max[:element] = element
    max[:value] = block_value
  end[:element]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
