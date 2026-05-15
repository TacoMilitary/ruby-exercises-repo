# frozen_string_literal: true

DIGIT_TO_STRING = (0..9).map { |int| [int, int.to_s] }.to_h.freeze

def integer_to_string(integer)
  negative = integer.negative?
  integer = integer.abs

  place = 10
  last_place = 0
  string = ''.dup
  current_number = 0

  loop do
    current_digit = integer % place
    current_number = current_digit

    current_digit /= last_place unless last_place.zero?
    string.prepend(DIGIT_TO_STRING[current_digit])

    last_place = place
    place *= 10
    break if current_number == integer
  end

  string.prepend('-') if negative
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p integer_to_string(-4821) == '-4821'
