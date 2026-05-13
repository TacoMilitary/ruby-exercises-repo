# frozen_string_literal: true

NUMBER_CHARS = ('0'..'9').to_a.freeze

def remove_num_prefix(string)
  string.delete_prefix('-').delete_prefix('+')
end

def string_to_integer(str_number = '0')
  clean_str = remove_num_prefix(str_number)
  characters = clean_str.chars.reverse

  converted_integer = 0
  num_place = 0
  until num_place >= characters.length
    char = characters[num_place]
    my_digit = NUMBER_CHARS.index(char)

    converted_integer += my_digit * (10**num_place)

    num_place += 1
  end

  sign = str_number.start_with?('-') ? -1 : 1
  converted_integer * sign
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('4321') == 4321
p string_to_integer('-570') == -570
p string_to_integer('+100') == 100
