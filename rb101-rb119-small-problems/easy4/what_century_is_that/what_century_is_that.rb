# frozen_string_literal: true

NUMBER_SUFFIX = %w[st nd rd th]

def number_suffix(number = 1)
  int_number = number.to_i
  digits = int_number.to_s.chars

  teens = digits[-2] == '1'
  suffix_place = teens ? 4 : [digits.last.to_i, 4].min
  suffix = NUMBER_SUFFIX[suffix_place - 1]

  "#{int_number.to_s}#{suffix}"
end

def century(year)
  century_num = (year / 100.0).ceil

  p number_suffix(century_num)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
