# frozen_string_literal: false

NUMERAL_DIGITS = {
  1 => 'I',
  5 => 'V',
  10 => 'X',
  50 => 'L',
  100 => 'C',
  500 => 'D',
  1000 => 'M'
}.freeze

def nearest_numeral(number, place_value)
  rounded = number + place_value
  return NUMERAL_DIGITS.assoc(rounded).map(&:dup) if NUMERAL_DIGITS.key?(rounded)

  NUMERAL_DIGITS.select { |(value)| value <= number }.min_by do |(value)|
    number - value
  end.map(&:dup)
end

def digit_numeral(digit, place_value = 1)
  return '' if digit.zero?

  real_value = digit * place_value
  rounded_value, numeral_digit = nearest_numeral(real_value, place_value)

  difference = real_value - rounded_value
  return numeral_digit if difference.zero?
  return "#{NUMERAL_DIGITS[place_value]}#{numeral_digit}" if difference.negative?

  add_times = difference / place_value
  added_numerals = nearest_numeral(difference, place_value).last * add_times
  numeral_digit << added_numerals
end

def roman_numeral(decimal)
  current_place_value = 10**decimal.to_s.size.pred

  decimal.to_s.each_char.with_object('') do |digit, numeral|
    roman_digit = digit_numeral(digit.to_i, current_place_value)
    current_place_value /= 10
    numeral << roman_digit
  end
end

p roman_numeral(1990) == 'MCMXC'
p roman_numeral(1000) == 'M'
p roman_numeral(900) == 'CM'
p roman_numeral(90) == 'XC'
p roman_numeral(2000) == 'MM'
p roman_numeral(8) == 'VIII'
p roman_numeral(1) == 'I'
