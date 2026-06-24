# frozen_string_literal: true

def valid_triangle?(side_lengths)
  return false if side_lengths.any? { |length| length <= 0 }
  return false unless side_lengths.min(2).sum > side_lengths.max
  true
end

def triangle(*side_lengths)
  return :invalid unless valid_triangle?(side_lengths)
  case side_lengths.tally.values.max
  when 3 then :equilateral 
  when 2 then :isosceles 
  else :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
