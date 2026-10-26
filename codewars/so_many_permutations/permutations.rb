def permutations(string)
  string.chars.permutation.map(&:join).uniq
end

# Given a string.
# Make all permutations of the characters into separate strings.
# Put these strings into an array.
# Do not allow duplicates.

# Split the string into its characters.
# Create permutations.
# Turn the permutations into strings.
# Remove duplicates, or disallow them entirely.
#
# The number of permutations should be the number of unique characters to the power of 2.

p permutations('a') == %w(a)
p permutations('ab') == %w(ab ba)
p permutations('abc') == %w(abc acb bac bca cab cba)
p permutations('aabb') == %w(aabb abab abba baab baba bbaa)
