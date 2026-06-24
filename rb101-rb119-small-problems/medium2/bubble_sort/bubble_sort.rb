# frozen_string_literal: true

def greater_than(first, second)
  (first <=> second) == 1
end

def bubble_sort!(array)
  final_index = array.size - 2
  loop do
    changes_made = false
    0.upto(final_index) do |idx|
      if greater_than(array[idx], array[idx.next])
        array[idx, 2] = array[idx, 2].reverse
        changes_made = true
      end
    end
    break unless changes_made
  end

  array
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)