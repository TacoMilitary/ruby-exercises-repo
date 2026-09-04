# Solution 1
def each_cons(array)
  index = 0

  until index >= (array.size - 1)
    yield(array[index..(index + 1)])
    index += 1
  end

  nil
end

require_relative 'part1_tests'
