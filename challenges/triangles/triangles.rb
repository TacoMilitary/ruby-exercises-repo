class Triangle
  attr_reader :sides

  INEQUALITY_MESSAGE = 'Sum of any two sides must be greater than third side.'
  BAD_SIDES = 'Must have 3 sides greater than 0.'

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    validate_sides
  end

  def validate_sides
    unless sides.size == 3 && sides.all? { |side| side > 0 }
      raise(ArgumentError, BAD_SIDES)
    end

    indices = (0..2).to_a
    indices.combination(2).each do |combo|
      third_index = (indices - combo).first
      unless combo.sum { |index| sides[index] } > sides[third_index]
        raise(ArgumentError, INEQUALITY_MESSAGE) 
      end
    end
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end
end