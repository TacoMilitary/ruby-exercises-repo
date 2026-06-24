# frozen_string_literal: true

def is_prime(candidate)
  return true if candidate == 2
  return false if candidate.even? || candidate.negative?
  square_root = candidate**0.5
  (3..square_root).step(2) { |odd_number| return false if (candidate % odd_number).zero? }
  true
end

puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true
puts(is_prime(23_297_061_5273_748) == false)     # true
puts(is_prime(94784_5236_275893_297_061_5273_748) == false)     # true
