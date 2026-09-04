require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class EachConsPart1Test < Minitest::Test
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
end
