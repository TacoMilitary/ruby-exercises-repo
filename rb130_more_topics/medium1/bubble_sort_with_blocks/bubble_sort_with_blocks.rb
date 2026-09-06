require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

def bubble_sort!(array)
  loop do
    changes_made = false

    (0...array.size.pred).each do |idx|
      slice = array[idx, 2]
      next if block_given? ? yield(*slice) : slice.first <= slice.last

      array[idx, 2] = slice.reverse
      changes_made = true
    end

    break unless changes_made
  end

  array
end

class SortCases < Minitest::Test
  def test_no_block_two
    array = [5, 3]
    bubble_sort!(array)
    assert_equal([3, 5], array)
  end

  def test_block_three
    array = [5, 3, 7]
    bubble_sort!(array) { |first, second| first >= second }
    assert_equal([7, 5, 3], array)
  end

  def test_no_block_five
    array = [6, 2, 7, 1, 4]
    bubble_sort!(array)
    assert_equal([1, 2, 4, 6, 7], array)
  end

  def test_block_big_numbers
    array = [6, 12, 27, 22, 14]
    bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
    assert_equal([14, 22, 12, 6, 27], array)
  end

  def test_no_block_names
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array)
    assert_equal(%w(Kim Pete Tyler alice bonnie rachel sue), array)
  end

  def test_block_names
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
    assert_equal(%w(alice bonnie Kim Pete rachel sue Tyler), array)
  end
end
