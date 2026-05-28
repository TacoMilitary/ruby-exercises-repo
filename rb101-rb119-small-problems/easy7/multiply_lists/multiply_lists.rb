# frozen_string_literal: true

def multiply_list(*arrays)
  return nil if arrays.size <= 1
  arrays.first.zip(*arrays[1..]).map! { |vals| vals.reduce(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
