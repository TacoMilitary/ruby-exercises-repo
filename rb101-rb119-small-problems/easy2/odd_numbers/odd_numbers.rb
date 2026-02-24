# frozen_string_literal: true

def print_odd_numbers_to_99
  (1..99).each { |n| puts(n) if n.odd? }
end

print_odd_numbers_to_99