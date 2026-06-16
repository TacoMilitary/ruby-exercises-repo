# frozen_string_literal: true

def longest_sentence(text)
  sentences = text.scan(/[^\s].*?[.!?]+/m).map do |sentence|
    { string: sentence, size: sentence.scan(/[^\s.?!]+/).size }
  end

  puts sentences.max_by { |sentence_info| sentence_info[:size] }.values.reverse.join("\n\n")
end

case1 = IO.read 'case1.txt'
case2 = IO.read 'case2.txt'

longest_sentence(case1)
puts "\n--------\n "
longest_sentence(case2)
