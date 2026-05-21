# frozen_string_literal: true

def digit_list(integer)
  unless integer.is_a?(Integer) && integer.positive?
    puts 'Must be a positive integer.'
    return
  end

  # integer.to_s.chars.map(&:to_i)
  integer.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
