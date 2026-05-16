# frozen_string_literal: true

def ascii_value(string)
  ascii = 0
  string.each_char { |chr| ascii += chr.ord unless chr.empty? }
  ascii
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
