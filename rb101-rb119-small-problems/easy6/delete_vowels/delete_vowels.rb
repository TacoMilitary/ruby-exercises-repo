# frozen_string_literal: true

VOWELS = 'aeiouAEIOU'

def remove_vowels(strings_array)
  strings_array.map { |str| str.delete(VOWELS) }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
