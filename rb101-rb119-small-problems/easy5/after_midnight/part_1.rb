# frozen_string_literal: true

MINUTES_HOUR = 60

HOURS_DAY = 24

def two_digit_string(number)
  number = number.to_s
  number.prepend('0') if number.length == 1
  number
end

def time_of_day(minutes)
  hours, minutes_left = minutes.divmod(MINUTES_HOUR)
  clock_hour = hours % HOURS_DAY
  "#{two_digit_string(clock_hour)}:#{two_digit_string(minutes_left)}"
end

p time_of_day(-428)
p time_of_day(0) == '00:00'
p time_of_day(-3) == '23:57'
p time_of_day(35) == '00:35'
p time_of_day(-1437) == '00:03'
p time_of_day(3000) == '02:00'
p time_of_day(800) == '13:20'
p time_of_day(-4231) == '01:29'
