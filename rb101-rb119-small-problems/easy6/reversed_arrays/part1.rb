# frozen_string_literal: true

def reverse!(array)
  half_index = array.length / 2
  (0...half_index).each do |index|
    reverse_index = -(index + 1)
    reverse_object = array[reverse_index]

    array[reverse_index] = array[index]
    array[index] = reverse_object
  end

  array
end

=begin
def reverse!(array)
  index = array.length - 1
  reversed_array = []
  until index < 0
    reversed_array << array[index]
    index -= 1
  end

  reversed_array
end
=end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = [1, 2, 3, 4, 1]
result = reverse!(list)
p result == [1, 4, 3, 2, 1] # true
p list == [1, 4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
