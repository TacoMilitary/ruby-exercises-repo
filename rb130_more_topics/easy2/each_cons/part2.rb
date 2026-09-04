# Solution 1
def each_cons(array, group_size = 2)
  index = 0
  group_index_offset = group_size - 1

  until index >= (array.size - group_index_offset)
    yield(*array[index..(index + group_index_offset)])
    index += 1
  end

  nil
end

require_relative 'tests'
