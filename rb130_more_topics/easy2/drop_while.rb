# Solution 1
def drop_while(array)
  array.each_with_index { |val, idx| return array[idx..] unless yield(val) }
  []
end

# Solution 2
# def drop_while(array)
#   dropped_array = array.dup
#   index = 0
# 
#   until index >= array.size
#     break unless yield(array[index])
#     dropped_array.shift
#     index += 1
#   end
# 
#   dropped_array
# end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
