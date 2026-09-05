def block_parameters(array)
  yield(*array)
end

birds = %w(raven finch hawk eagle)

block_parameters(birds) do |_, _, *raptors|
  puts 'Here are my cool birds!'
  puts raptors
end

block_parameters(birds) do |*_, hawk, eagle|
  puts 'Here are my cool birds!'
  puts "#{hawk}\n#{eagle}"
end

block_parameters(birds) do |_, *other_birds, eagle|
  puts 'Here are my cool birds!'
  puts "#{other_birds.last}\n#{eagle}"
end
