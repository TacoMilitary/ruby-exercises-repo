# Solution 1
def step(start, finish, gait)
  value = start

  until value > finish
    yield(value)
    value += gait
  end

  finish
end

# Solution 2
# def step(start, finish, gait)
#   ((finish - start) / gait + 1).times do |iteration|
#     true_value = start + gait * iteration
#     yield(true_value)
#   end
# 
#   finish
# end

step(1, 10, 3) { |value| puts "value = #{value}" }
