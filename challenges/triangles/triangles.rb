class Triangle
  attr_reader :sides

  INEQUALITY_MESSAGE = 'Sum of any two sides must be greater than third side.'
  BAD_SIDES = 'Must have 3 sides greater than 0.'

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    validate_sides
  end

  def validate_sides
    unless sides.size == 3 && sides.first > 0
      raise(ArgumentError, BAD_SIDES)
    end

    unless sides.first(2).sum > sides.max
      raise(ArgumentError, INEQUALITY_MESSAGE)
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
