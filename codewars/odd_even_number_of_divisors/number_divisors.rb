def oddity(n)
  (2..n/2).count { |divisor| (n % divisor).zero? }.odd? ? 'odd' : 'even'
end

def divisors(n)
  (1..n).select { |divisor| (n % divisor).zero? }
end

p oddity(4) == 'odd'
p oddity(12) == 'even'
p oddity(1000)

# Given a number. (n)
# Find all the divisors from itself down to 1.
# Return odd/even based on the number of divisors.
# The first divisor is always half of the number.