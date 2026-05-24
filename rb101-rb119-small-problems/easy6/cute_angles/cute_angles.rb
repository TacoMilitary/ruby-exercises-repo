# frozen_string_literal: true

DEG_SUFFIX = "\u00B0"

MIN_SUFFIX = "'"

SEC_SUFFIX = '"'

SEC_PER_MIN = 60

MIN_PER_DEG = 60

DECIMAL_PRECISION = 1000000.0

def fix_precision(float)
  (float * DECIMAL_PRECISION).round / DECIMAL_PRECISION
end

def format_num(number)
  str_num = number.to_s
  str_num.prepend '0' if str_num.length < 2
  str_num
end

def convert_units(number, unit_conversion)
  fraction = fix_precision(number % 1)
  whole_number = (number - fraction).round
  [whole_number, fraction * unit_conversion]
end

def dms(degrees)
  dms_degrees, dms_minutes = convert_units(degrees, MIN_PER_DEG)
  dms_minutes, dms_seconds = convert_units(dms_minutes, SEC_PER_MIN)
  dms_seconds = dms_seconds.round
  
  deg_text = "#{dms_degrees}#{DEG_SUFFIX}"
  min_text = "#{format_num(dms_minutes)}#{MIN_SUFFIX}"
  sec_text = "#{format_num(dms_seconds)}#{SEC_SUFFIX}"
  "#{deg_text}#{min_text}#{sec_text}"
end

# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
