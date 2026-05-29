# frozen_string_literal: true

def substrings(string)
  char_count = string.size
  substrings_array = Array.new(char_count) do |char_index|
    substring = ''.dup
    Array.new(char_count - char_index) do |sub_index|
      substring += string[char_index + sub_index]
    end
  end

  substrings_array.flatten
end

def palindromes(string)
  all_substrings = substrings string
  palindromics = all_substrings.keep_if { |substr| substr.size > 1 && substr == substr.reverse }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
