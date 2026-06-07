# frozen_string_literal: true

def trapezoid()

end

def diamond(size)
  half_size = (size / 2.0).ceil
  size.times do |row_number|
    row_visual = '*' * [1, row_number.next].min
    puts row_visual.rjust(half_size)
  end
end

diamond(3)