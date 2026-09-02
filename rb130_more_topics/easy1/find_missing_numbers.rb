# def missing(integers)
#   range = ((integers.first + 1)...integers.last)
#   range.reject { |int| integers.include? int }
# end

def missing(integers)
  index = 1
  current_number = integers.first + 1
  last_number = integers.first
  missing_integers = []

  until index >= integers.size
    if current_number == integers[index]
      index += 1
    else
      missing_integers << current_number
    end
    current_number += 1
  end

  missing_integers
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
