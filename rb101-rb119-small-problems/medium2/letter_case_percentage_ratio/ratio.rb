# frozen_string_literal: true

TO_PERCENT = 100.0

def letter_percentages(str)
  chr_count = str.size.to_f
  ratios = Hash.new
  ratios[:lowercase] = str.count('a-z') / chr_count * TO_PERCENT
  ratios[:uppercase] = str.count('A-Z') / chr_count * TO_PERCENT
  ratios[:neither] = TO_PERCENT - ratios.values.sum
  ratios
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
