# frozen_string_literal: true

UPPER_LETTERS = ('A'..'Z').freeze

def swapcase(string)
  string.each_char.with_object(''.dup) do |char, new_string|
    swapped_char = UPPER_LETTERS.include?(char) ? char.downcase : char.upcase
    new_string << swapped_char
  end
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
