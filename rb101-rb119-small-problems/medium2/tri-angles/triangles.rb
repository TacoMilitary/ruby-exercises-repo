# frozen_string_literal: true

def valid_triangle?(angles)
  return false unless angles.sum == 180
  return false if angles.any? { |deg| deg <= 0 }
  true
end

=begin
def triangle(*angles)
  return :invalid unless valid_triangle?(angles)
  if angles.include? 90
    :right
  elsif angles.any? { |deg| deg > 90 }
    :obtuse
  else
    :acute
  end
end
=end

def triangle(*angles)
  return :invalid unless valid_triangle?(angles)
  angles.each do |deg|
    return :right if deg == 90
    return :obtuse if deg > 90
  end
  :acute
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
