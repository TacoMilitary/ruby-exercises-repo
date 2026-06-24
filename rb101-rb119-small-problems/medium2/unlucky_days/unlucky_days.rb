# frozen_string_literal: true

require 'date'

def friday_13th(year)
  (1..12).reduce(0) { |fridays, month| Date.new(year, month, 13).friday? ? fridays.next : fridays }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
