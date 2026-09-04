# Solution 1
def each_cons(array, group_size = 2)
  index = 0

  until index > (array.size - group_size)
    yield(*array[index, group_size])
    index += 1
  end

  nil
end

require_relative 'tests'
