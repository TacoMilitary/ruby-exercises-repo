# frozen_string_literal: true

require 'benchmark'

def include?(haystack, needle)
  haystack.any? needle
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
