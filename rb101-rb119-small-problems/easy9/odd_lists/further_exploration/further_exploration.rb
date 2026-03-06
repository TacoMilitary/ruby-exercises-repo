# frozen_string_literal: true

def oddities(array)
  array.each_slice(2).map { |pair| pair[0] }
end

def oddities1(array)
  new_array = []
  index = 0
  until index > (array.length - 1)
    new_array << array[index]
    index += 2
  end

  new_array
end

def oddities2(array)
  new_array = []
  array.each_with_index { |num, ind| new_array << num if (ind % 2).zero? }

  new_array
end

def oddities3(array)
  new_array = []
  (1..array.length).step(2) { |index| new_array << array[index - 1] }

  new_array
end

def oddities4(array)
  Array.new(array.length) { |index| array[index] if (index % 2).zero? }.compact
end

def evenities(array)
  array.each_slice(2).map { |pair| pair[1] }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
