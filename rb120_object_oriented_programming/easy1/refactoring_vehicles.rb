class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class.wheels
  end
end

class Car < Vehicle
  def self.wheels
    4
  end
end

class Motorcycle < Vehicle
  def self.wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def self.wheels
    6
  end
end

puts Car.wheels
puts Motorcycle.wheels
puts Truck.wheels
