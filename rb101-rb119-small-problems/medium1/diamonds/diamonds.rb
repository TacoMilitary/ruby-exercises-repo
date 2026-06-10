# frozen_string_literal: true

def calc_row(row, size, middle_row)
  distance_from_middle = (middle_row - row).abs
  size - distance_from_middle * 2
end

def diamond(size, fill: true)
  middle_row = (size / 2).next
  1.upto(size) do |row|
    row_size = calc_row(row, size, middle_row)
    row_text = ('*' * row_size).center(size)
    puts row_text
  end
end

diamond(1)

diamond(3)

diamond(9)

diamond(13)