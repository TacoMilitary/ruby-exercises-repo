# frozen_string_literal: true

def penultimate(sentence)
  sentence.split[-2]
end

def middle_word(sentence)
  words = sentence.split
  num_words = words.size

  # Handle cases where there are no words or only one word.
  return '' if num_words.zero?
  return words.last if num_words <= 1

  middle_index = num_words.fdiv(2).ceil
  words[middle_index]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
