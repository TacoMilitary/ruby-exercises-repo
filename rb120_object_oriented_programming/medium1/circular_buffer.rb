class CircularBuffer
  def initialize(size)
    @fixed_size = size
    @last_position = 0
    @collection = init_collection
  end

  def put(new_element)
    next_position = wrap_to_size(last_position.next)
    collection[next_position] = new_element
    self.last_position = next_position
  end

  def get
    (1..fixed_size).each do |distance_from_last|
      check_position = wrap_to_size(last_position + distance_from_last)
      next unless collection[check_position]

      return_value = collection[check_position]
      collection[check_position] = nil
      return return_value
    end
    nil
  end

  def to_s
    collection.values.to_s
  end

  def inspect
    collection.values.inspect
  end

  private

  def wrap_to_size(number)
    number % fixed_size
  end

  def init_collection
    (1..fixed_size).map { |position| [position, nil] }.to_h
  end

  attr_reader :collection, :fixed_size
  attr_accessor :last_position
end

# Test Cases - Should output true 15 times.

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil