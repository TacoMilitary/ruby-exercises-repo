module Walkable
  def walk 
    p "#{self.name} #{self.gait} forward"
  end
end

class Noble
  attr_reader :title, :name

  def initialize(name, title)
    @title = title
    @name = name
  end

  def gait
    'struts'
  end

  def walk
    p "#{title} #{name} #{gait} forward"
  end
end

# Test Cases

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
