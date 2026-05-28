# frozen_string_literal: true

def count_occurrences(array)
  occurences = Hash.new 0
  array.each { |element| occurences[element] += 1 }
  occurences
end

vehicles = %w[car car truck car SUV truck motorcycle motorcycle car truck]

p count_occurrences(vehicles)
