# frozen_string_literal: true

def interleave(array1, array2)
  array1.map.with_index { |obj, ind| [obj, array2[ind]] }.flatten 1
end

p interleave([1, 2, 3], %w[a b c]) == [1, 'a', 2, 'b', 3, 'c']
