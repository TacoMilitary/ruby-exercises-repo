require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

def bubble_sort!(array)
  loop do
    changes_made = false

    (0...array.size.pred).each do |idx|
      next if yield(array[idx]) <= yield(array[idx.next])

      array[idx, 2] = array[idx, 2].reverse
      changes_made = true
    end

    break unless changes_made
  end

  array
end

class SortCases < Minitest::Test
  def test_names_block
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array) { |value| value.downcase }
    assert_equal(%w(alice bonnie Kim Pete rachel sue Tyler), array)
  end
end
