# frozen_string_literal: true

def display_rng_teddy_age(greater_than = 20, less_than = 200)
  real_min = greater_than + 1
  teddy_age = rand(real_min...less_than)
  puts "Teddy is #{teddy_age} years old!"
end

display_rng_teddy_age(20, 200)
