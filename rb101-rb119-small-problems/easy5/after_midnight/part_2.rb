# frozen_string_literal: true

MINUTES_PER_HOUR = 60

MINUTES_PER_DAY = 1440

def after_midnight(clock_time)
  hours_minutes = clock_time.split(':').map(&:to_i)
  minutes_from_hours = hours_minutes.first * MINUTES_PER_HOUR
  (minutes_from_hours + hours_minutes.last) % MINUTES_PER_DAY
end

def before_midnight(clock_time)
  hours_minutes = clock_time.split(':').map(&:to_i)
  minutes_from_hours = MINUTES_PER_DAY - hours_minutes.first * MINUTES_PER_HOUR
  (minutes_from_hours - hours_minutes.last) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

p before_midnight('23:59') == 1
p before_midnight('00:01') == 1439
p before_midnight('13:00') == 660

