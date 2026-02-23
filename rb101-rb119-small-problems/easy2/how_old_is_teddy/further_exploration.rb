# frozen_string_literal: true

DEFAULT_NAME = 'Teddy'
NAME_PROMPT = 'Give me a name. I will find the age of this person.'

def prompt_user(prompt)
  puts prompt
  print '> '
  gets.chomp.strip
end

def display_age_of(name = DEFAULT_NAME, greater_than = 20, less_than = 200)
  real_min = greater_than + 1
  person_age = rand(real_min...less_than)

  name = DEFAULT_NAME if name.empty?
  puts "#{name} is #{person_age} years old!"
end

input_name = prompt_user(NAME_PROMPT)
display_age_of(input_name, 20, 200)
