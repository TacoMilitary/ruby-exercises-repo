# frozen_string_literal: true

require 'date'

def leap_year?(year)
  Date.gregorian_leap?(year)
end

def leap_year_complex?(year)
  divisible_by_4 = year.modulo(4) == 0
  divisible_by_100 = year.modulo(100) == 0
  divisible_by_400 = year.modulo(400) == 0

  first_rule = (divisible_by_4 && !divisible_by_100)
  second_rule = (divisible_by_100 && divisible_by_400)
  
  first_rule || second_rule
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true