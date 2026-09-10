def triangle_valid?(*sides)
# return false unless sides.size == 3 && sides.all? { |side| side > 0 }

# indices = (0..2).to_a
# indices.combination(2).any? do |combo|
#   third_index = (indices - combo).first
#   combo.sum { |index| sides[index] } > sides[third_index]
# end
  sides.size == 3 && sides.all? { |side| side > 0 }
end

def triangle_type(*sides)
  return :invalid unless triangle_valid?(*sides)

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isoceles
  when 3 then :scalene
  end
end

p triangle_type(2, 2, 2, 5, 7, 89) == :invalid
p triangle_type == :invalid
p triangle_type(1) == :invalid
p triangle_type(0, 2, 2) == :invalid
p triangle_type(-5, 2, -1) == :invalid
puts '-----------'
p triangle_type(2, 2, 2) == :equilateral
p triangle_type(3, 3, 2) == :isoceles
p triangle_type(8, 3, 2) == :scalene
