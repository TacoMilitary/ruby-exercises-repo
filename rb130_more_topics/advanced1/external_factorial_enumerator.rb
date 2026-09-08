factorials = Enumerator.new do |yielder|
  puts 'back up to top'
  n_place = 0
  product = 1
  loop do
    puts 'before yield'
    yielder.yield(product)
    puts 'after yield'
    n_place += 1
    product = [product * n_place, 1].max
    puts 'finished loop'
  end
end

6.times { puts factorials.next }

puts '-------'

3.times { puts factorials.next }

factorials.rewind

puts '-------'

6.times { puts factorials.next }

# Somehow, ::Yielder is able to pause our loop from within itself.
# Then resumes the loop again on the next `#next` call.
# `#rewind` then terminates our block, causing `#next` to recall the block.
# This means the block never fully finishes execution with an infinite loop
# like this.
