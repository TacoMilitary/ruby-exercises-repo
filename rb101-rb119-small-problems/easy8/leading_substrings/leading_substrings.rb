# frozen_string_literal: true

def leading_substrings(string)
  substring = ''.dup
  Array.new(string.size) { |index| substring += string[index] }
end

p leading_substrings('abc')
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
