# frozen_string_literal: true

def halvsies(array)
  last_length = array.length
  first_length = (last_length / 2.0).ceil
  last_length -= first_length
  [array.first(first_length), array.last(last_length)]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] # true
p halvsies([1, 2, 3, 4, 1]) == [[1, 2, 3], [4, 1]] # true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]] # true
p halvsies([5]) == [[5], []] # true
p halvsies([]) == [[], []] # true
