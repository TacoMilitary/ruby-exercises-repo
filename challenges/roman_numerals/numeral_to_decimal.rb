NUMERAL_TO_DECIMAL = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}.freeze

def decimal_number(numeral)
  number = 0
  last_value = 0

  numeral.reverse.each_char do |numeral|
    value = NUMERAL_TO_DECIMAL[numeral]
    number += value < last_value ? -value : value
    last_value = value
  end

  number
end

p decimal_number('MCMXC') == 1990
p decimal_number('M') == 1000
p decimal_number('CM') == 900
p decimal_number('XC') == 90
p decimal_number('MM') == 2000
p decimal_number('VIII') == 8
