# frozen_string_literal: false

DIGIT_WORDS = %w[zero one two three four five six seven eight nine].freeze

def word_to_digit(sentence)
  sentence.gsub(/#{DIGIT_WORDS.join('|')}/i) { |word| DIGIT_WORDS.index(word) }
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
