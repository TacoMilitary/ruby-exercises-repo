def prime?(n)
  return true if n == 2
  return false if n.even? || n < 2

  root = (n**0.5).to_i
  (3..root).step(2).none? { |divisor| (n % divisor).zero?  }
end

def sum_primes(lower, upper)
  (lower..upper).sum { |candidate| prime?(candidate) ? candidate : 0 }
end

# require 'prime'
# 
# def sum_primes(lower, upper)
#   (lower..upper).select(&:prime?).sum
# end

p sum_primes(4, 20) == 72  # 5 + 7 + 11 + 13 + 17 + 19 = 72

p sum_primes(20, 4) == 0  # since lower is greater than upper

p sum_primes(2, 7) == 17  # 2 + 3 + 5 + 7 = 17

p sum_primes(11, 11) == 11  # it consists of one prime number

p sum_primes(60, 60) == 0  # since 60 is not a prime number

# How to find prime?
# Find square root.
# From 1 to the square root.
# If the number is divisble by the current number.
# It is not a prime.