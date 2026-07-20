class Cat
  CAT_COLOR = 'orange'.freeze
  @@cat_count = 0

  attr_reader :name

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def self.total
    @@cat_count
  end

  def initialize(name)
    @@cat_count += 1
    @name = name
  end

  def rename(new_name)
    @name = new_name
  end

  def identify
    self
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{CAT_COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new 'Sophie'

puts kitty
