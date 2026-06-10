# frozen_string_literal: true

DIGIT_WORDS = %w[zero one two three four five six seven eight nine].freeze

def word_to_digit(sentence)
  DIGIT_WORDS.each_with_index { |word, digit| sentence.gsub!(word, digit.to_s) }
  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
