users_selection 'talk'

# if statement Selection Tree

if users_selection == 'talk'
  puts 'You talk it out.'
elsif users_selection == 'fight'
  puts 'You fight them!'
elsif users_selection == 'run'
  puts 'You run away!'
else
  puts 'You stand still and do nothing.'
end

# case statement Selection Tree

case users_selection
when 'talk'
  puts 'You talk it out.'
when 'fight'
  puts 'You fight them!'
when 'run'
  puts 'You run away!'
else
  puts 'You stand still and do nothing.'
end
