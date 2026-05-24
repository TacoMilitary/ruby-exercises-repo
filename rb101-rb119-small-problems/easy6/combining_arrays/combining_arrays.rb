# frozen_string_literal: true

def merge(array1, array2)
  (array1 + array2).uniq
end

=begin
def merge(array1, array2)
  merged_array = array1.dup
  array2.each { |element| merged_array << element unless merged_array.include?(element) }
  merged_array
end
=end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
