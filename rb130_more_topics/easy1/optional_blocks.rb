def compute(argument)
  block_given? ? yield(argument) : 'Does not compute.'
end

p compute(17) { |arg| arg + 5 + 3 } == 25
p compute('useless argument') { 'a' + 'b' } == 'ab'
p compute('bruh') == 'Does not compute.'
