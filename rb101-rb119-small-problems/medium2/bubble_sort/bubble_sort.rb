# frozen_string_literal: true

def greater_than(first, second)
  (first <=> second) == 1
end

# Solution 1
=begin
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
=end

# Solution 2

def sort_pass!(array)
  stop_at = array.size - 1
  index = 0
  until index >= stop_at
    if greater_than(array[index], array[index.next])
      array[index], array[index.next] = array[index.next], array[index] 
    end
    index += 1
  end
  array
end

def bubble_sort!(array)
  sorted = array.sort
  sort_pass!(array) until array == sorted
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