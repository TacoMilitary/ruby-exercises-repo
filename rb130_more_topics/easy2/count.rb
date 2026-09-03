# Solution 1
# def count(*cases)
#   count = 0
#   cases.each { |value| count += 1 if yield(value) }
#   count
# end

# Solution 2
def count(*cases)
  cases.reduce(0) { |count, value| yield(value) ? count + 1 : count }
end

# The below solutions kind break the rules of 
# not using other iterative methods.

# Solution 3
# def count(*cases)
#   cases.select { |value| yield(value) }.size
# end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
