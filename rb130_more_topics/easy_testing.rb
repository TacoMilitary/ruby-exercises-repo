require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

system 'clear'
puts Time.now

class BooleanAssertions < Minitest::Test
  def test_value_is_odd
    value = 3
    # the problem says fail if value.odd? is NOT true
    # not that it should fail if it doesnt evaluate as true
    # to me this reads as, it needs to be equal to the true object
    assert_equal(true, value.odd?)
  end
end

class EqualityAssertions < Minitest::Test
  def test_downcase_value
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end

class NilAssertions < Minitest::Test
  def test_value_is_nil
    value = nil
    assert_nil value
  end
end

class EmptyObjectAssertions < Minitest::Test
  def test_list_is_empty
    list = []
    assert_empty list
  end
end

class IncludedObjectAssertions < Minitest::Test
  def test_xyz_in_list
    list = ['abc', 'xyz']
    assert_includes(list, 'xyz')
  end
end

# vvv Exception Assertions vvv

class NoExperienceError < StandardError; end

class Employee
  attr_reader :experience, :hired

  def initialize(experience)
    @experience = experience
    @hired = false
  end

  def hire
    if experience < 3
      raise NoExperienceError
    else
      @hired = true
    end
  end
end

class TestEmployee < Minitest::Test
  def test_hire_exception_with_low_experience
    employee = Employee.new(2)
    assert_raises(NoExperienceError) { employee.hire }
  end
end

# ^^^ Exception Assertions ^^^

class TypeAssertions < Minitest::Test
  def test_value_is_instance_of_numeric
    value = 42
    assert_instance_of(Integer, value)
  end
end

class KindAssertions < Minitest::Test
  def test_value_is_kind_of_numeric
    value = 42.42
    assert_kind_of(Numeric, value)
  end
end

# vvv Same Object Assertions vvv

class MyList
  def initialize(*values)
    @values = values
  end

  def process
    self
  end
end

class SameObjectAssertions < Minitest::Test
  def test_process_returns_self
    list = MyList.new
    assert_same(list, list.process)
  end
end

# ^^^ Same Object Assertions ^^^

class Refutations < Minitest::Test
  def test_list_does_not_include_xyz
    list = ['abc', 'def']
    refute_includes(list, 'xyz')
  end
end
