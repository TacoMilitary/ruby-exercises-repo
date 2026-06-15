# frozen_string_length: true

def thanos_sort(arr)
  result = arr
  while result != result.sort
    middle = (result.size / 2.0).ceil - 1
    result = result[..middle]
  end
  result.size
end

p thanos_sort([9, 8, 7, 1, 2, 3]), 3
