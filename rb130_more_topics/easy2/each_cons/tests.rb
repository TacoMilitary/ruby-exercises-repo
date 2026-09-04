require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class EachConsTests < Minitest::Test
  attr_accessor :hash

  def setup
    @hash = {}
  end

  def test_integers
    result = each_cons([1, 3, 6, 10]) do |value1, value2|
      hash[value1] = value2
    end

    assert_equal(nil, result)
    assert_equal({ 1 => 3, 3 => 6, 6 => 10 }, hash)
  end

  def test_empty_array
    result = each_cons([]) do |value1, value2|
      hash[value1] = value2
    end

    assert_equal(nil, result)
    assert_equal({}, hash)
  end

  def test_letters
    result = each_cons(['a', 'b']) do |value1, value2|
      hash[value1] = value2
    end

    assert_equal(nil, result)
    assert_equal({'a' => 'b'}, hash)
  end

  # below are the part2 tests, you might want to
  # comment these out if you dont want them to run

  def test_all_integers
    each_cons([1, 3, 6, 10], 1) do |value|
      hash[value] = true
    end

    assert_equal({ 1 => true, 3 => true, 6 => true, 10 => true }, hash)
  end

  def test_normal_integer_pairs
    each_cons([1, 3, 6, 10], 2) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({ 1 => 3, 3 => 6, 6 => 10 }, hash)
  end

  
end