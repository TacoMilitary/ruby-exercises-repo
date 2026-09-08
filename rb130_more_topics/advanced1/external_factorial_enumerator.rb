factorials = Enumerator.new do |yielder|
  n_place = 0
  product = 1
  loop do
    yielder.yield(product)
    n_place += 1
    product = [product * n_place, 1].max
  end
end

6.times { puts factorials.next }

puts '-------'

3.times { puts factorials.next }

factorials.rewind

puts '-------'

6.times { puts factorials.next }
