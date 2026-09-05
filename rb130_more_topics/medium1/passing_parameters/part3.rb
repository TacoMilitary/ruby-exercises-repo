items = ['apples', 'corn', 'cabbage', 'wheat']

system 'clear'

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

def line_break
  puts "\n----------\n\n"
end

gather(items) do |*various_food, wheat|
  puts various_food.join ', '
  puts wheat
end

line_break

gather(items) do |apples, *various_food, wheat|
  puts apples
  puts various_food.join ', '
  puts wheat
end

line_break

gather(items) do |apples, *various_food|
  puts apples
  puts various_food.join ', '
end

line_break

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end
