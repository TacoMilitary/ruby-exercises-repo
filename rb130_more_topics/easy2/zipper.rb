# Solution 1
# def zip(array1, array2)
#   array1.each_index.with_object([]) do |index, zipped_array|
#     zipped_elements = [array1[index], array2[index]]
#     zipped_array << zipped_elements
#   end
# end

# Solution 2
# def zip(array1, array2)
#   zipped_array = []
#   array1.each_index { |index| zipped_array << [array1[index], array2[index]] }
#   zipped_array
# end

# Solution 3
def zip(array1, array2)
  Array.new(array1.size) { |index| [array1[index], array2[index]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
