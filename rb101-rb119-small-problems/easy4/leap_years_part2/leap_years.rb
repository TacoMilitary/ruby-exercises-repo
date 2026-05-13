# frozen_string_literal: true

require 'date'

def leap_year?(year)
  divisible_by4 = year.modulo(4).zero?

  # Julian Calendar Leap Year
  julian_leap = divisible_by4 && year < 1752
  return true if julian_leap

  divisible_by100 = year.modulo(100).zero?
  divisible_by400 = year.modulo(400).zero?

  first_rule = (divisible_by4 && !divisible_by100)
  second_rule = (divisible_by100 && divisible_by400)

  first_rule || second_rule
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240_000) == true
p leap_year?(240_001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
