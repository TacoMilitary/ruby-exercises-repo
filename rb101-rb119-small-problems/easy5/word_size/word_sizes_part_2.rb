# frozen_string_literal: true

def word_sizes(sentence)
  sizes_hash = Hash.new(0)

  sentence.split.each { |word| sizes_hash[word.delete('^A-Za-z').size] += 1 }

  sizes_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
