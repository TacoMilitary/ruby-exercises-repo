# frozen_string_literal: true

def solution1(text)
  sentences = text.scan(/[^\s].*?[.!?]+/m).map do |sentence|
    { size: sentence.scan(/[^\s.?!]+/).size, string: sentence }
  end

  puts sentences.max_by { |sentence_info| sentence_info[:size] }.values.join("\n--------\n")
end

# Whitespace not really needed to be included in the regex,
# since later we use #split on the strings, which does it anyway.
# Left it to be explicit.

def solution2(text)
  sentences = text.split(/[.!?]+\s*/).map { |sentence| {size: sentence.split.size, string: sentence } }
  longest = sentences.max_by { |sentence_info| sentence_info[:size] }
  puts "Words: #{longest[:size]}\n--------\n#{longest[:string]}"
end

case1 = IO.read 'case1.txt'
case2 = IO.read 'case2.txt'

solution1(case1)
puts "\n--------\n "
solution2(case2)
