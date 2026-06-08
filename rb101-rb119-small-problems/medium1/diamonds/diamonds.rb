# frozen_string_literal: true

def diamond_row_size(row, size, middle_row)
  if row > middle_row
    size - ((row - middle_row) * 2)
  else
    row * 2 - 1
  end
end

def diamond(size)
  diamond_str = +''
  middle_row = (size / 2.0).ceil
  (1..size).each do |row|
    row_size = diamond_row_size(row, size, middle_row)
    row_half_size = row_size / 2
    spaces = ' ' * (middle_row - row_half_size.next)
    diamond_str << "#{spaces}#{'*' * row_size}\n"
  end

  puts diamond_str
end

diamond(3)

diamond(9)
