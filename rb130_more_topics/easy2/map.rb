# Solution 1
def map(array)
  Array.new(array.size) { |index| yield(array[index]) }
end

# Solution 2
# def map(array)
#   transformed_array = []
#   array.each { |element| transformed_array << yield(element) }
#   transformed_array
# end

# Solution 3
# def map(array)
#   array.reduce([]) { |transformed, element| transformed << yield(element) }
# end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
