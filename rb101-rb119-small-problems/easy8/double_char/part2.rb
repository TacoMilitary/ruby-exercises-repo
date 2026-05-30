# frozen_string_literal: true

CONSONANTS = (('a'..'z').to_a - 'aeiou'.chars).freeze

def consonant?(chr)
  CONSONANTS.include? chr.downcase
end

def double_consonants(string)
  string.chars.map! { |chr| consonant?(chr) ? chr * 2 : chr }.join
end

p double_consonants('String') == 'SSttrrinngg'
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') == 'JJullyy 4tthh'
p double_consonants('') == ''
