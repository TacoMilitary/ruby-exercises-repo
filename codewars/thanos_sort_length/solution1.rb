# frozen_string_length: true

def thanos_sort(arr)
  result = arr
  loop do
    middle = (result.size / 2.0).ceil - 1
    second_half = result[middle..]
    return second_half.size if second_half == second_half.sort
    first_half = result[..middle]
    return first_half.size if first_half == first_half.sort
    result = first_half
  end
end

p thanos_sort([9, 8, 7, 1, 2, 3]), 3
