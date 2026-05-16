# frozen_string_literal: true

MINUTES_PER_HOUR = 60

def after_midnight(clock_time)
  hours_minutes = clock_time.split(':').map(&:to_i)
  minutes_from_hours = hours_minutes.first * MINUTES_PER_HOUR
  (minutes_from_hours + hours_minutes.last) % 1440
end

def before_midnight(clock_time)
  hours_minutes = clock_time.split(':').map(&:to_i)
  minutes_from_hours = hours_minutes.first * MINUTES_PER_HOUR
  (minutes_from_hours - hours_minutes.last) % 1440
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
