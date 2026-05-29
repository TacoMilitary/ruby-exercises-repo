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

p substrings('abcde') == %w[
  a ab abc abcd abcde
  b bc bcd bcde
  c cd cde
  d de
  e
]
