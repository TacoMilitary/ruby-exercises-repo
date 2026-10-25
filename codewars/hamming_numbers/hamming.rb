def hamming(n)
  return n if n <= 6

  (7..n).reduce(7) do |last_hamming, _|
    (last_hamming.next..).find do |hamming|
      [5, 3, 2].any? { |ijk| (hamming % ijk).zero? }
    end
  end
#   (n.next..).find do |h|
#     [5, 3, 2].any? do |ijk|
#       (h % ijk).zero? && (h / ijk) <= 5
#     end
#   end
end

# Hamming Number
# Positive Integer in form 2**i * 3**j * 5**k
# i, j, and k being non-negative integers.
# This method should return the (n) number in the hamming sequence.

# Sequence:
# n: 1 2 3 4 5 6 7 8 9  10 11 12 13 14 15
# h: 1 2 3 4 5 6 8 9 10 12 15 16 18 20 24

# Run (n) through an equation to interpret the real number.

# 6 and every number under is just equal to itself.
# Result will be equal to or greater then n.
# Result must be divisible by i, j, or k.

# How do we ensure that h isn't just immediately the current n?
# => We don't. The guard <= 6 takes care of that. Probably.

# Build the sequence from 1 to (n).
# Each time, try each number from our last (h) to infinity.
# Checking if it fits our pattern of divisible by ijk and goes into them less than 5.
# If it is, this is the new (h).
# Until finally, we've done this process (n) times and find our last (h).

# Use #times on (n) minus 6 and call reduce to track (h).
# (h) should be initialized to 1 I guess.
# Call Range#find on a range from (h) plus one to infinity.
# Implement block logic to capture a number divisible by ijk and goes into ijk less than or equal to 5.
# Naturally, at the end of our times and reduce calls, we will have our hamming number.

# Error:
# Works flawlessy until 12. Gets 20 instead of 16.

30.times { |number| puts "#{number.next}: #{hamming(number.next)}" }
