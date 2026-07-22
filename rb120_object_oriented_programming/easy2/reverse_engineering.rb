class Transform
  def self.lowercase(string)
    string.downcase
  end

  def self.uppercase(string)
    string.upcase
  end

  def initialize(string)
    @string_data = string
  end

  def to_s
    @string_data
  end

  def uppercase
    self.class.uppercase(@string_data)
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
