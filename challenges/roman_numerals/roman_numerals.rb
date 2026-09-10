DIGIT_NUMERALS = (0..9).zip(
  ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']
).to_h

def roman_numeral(decimal)
  decimal.to_s.chars.each_with_object('') do |char, numeral|
    roman_digit = DIGIT_NUMERALS[char.to_i]
    numeral << roman_digit
  end
end

p roman_numeral(1990) # == 'MCMXC'
p roman_numeral(1000) # == 'M'
p roman_numeral(900) # == 'CM'
p roman_numeral(90) # == 'XC'
p roman_numeral(2000) # == 'MM'
p roman_numeral(8) # == 'VIII'
