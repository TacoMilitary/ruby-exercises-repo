def divisors(positive_int)
  root = positive_int**0.5
  (1..root).each_with_object([]) do |number, divisors|
    next unless (positive_int % number).zero?
    divisors.push(number, positive_int / number)
  end.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
