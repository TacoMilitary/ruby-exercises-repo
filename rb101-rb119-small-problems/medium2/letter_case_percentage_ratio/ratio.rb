# frozen_string_literal: true

TO_PERCENT = 100.0
UPPERCASE_LETTERS = 'A'..'Z'
LOWERCASE_LETTERS = 'a'..'z'

def letter_percentages(str)
  chr_count = str.size.to_f
  return 0 if chr_count.zero?
  ratios = Hash.new
  ratios[:lowercase] = str.count('a-z') / chr_count * TO_PERCENT
  ratios[:uppercase] = str.count('A-Z') / chr_count * TO_PERCENT
  ratios[:neither] = TO_PERCENT - ratios.values.sum
  ratios
end

def letter_percentages(str)
  return 0 if str.empty?
  ratios = { uppercase: 0, lowercase: 0, neither: 0 }
  str.each_char do |chr|
    case chr
    when UPPERCASE_LETTERS then ratios[:uppercase] += 1
    when LOWERCASE_LETTERS then ratios[:lowercase] += 1
    else ratios[:neither] += 1
    end
  end
  chr_count = str.size.to_f
  ratios.each { |key, count| ratios[key] = count / chr_count * TO_PERCENT }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
