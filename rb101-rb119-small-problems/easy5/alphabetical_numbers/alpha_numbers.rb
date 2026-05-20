# frozen_string_literal: true

require 'yaml'

INTEGER_NAMES = YAML.load_file('integer_names.yml').freeze

p INTEGER_NAMES

def alphabetic_number_sort(numbers)
  numbers.sort { |a, b| INTEGER_NAMES[a] <=> INTEGER_NAMES[b] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
