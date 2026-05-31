# frozen_string_Literal: true

=begin
def reverse_sentence(sentence)
  sentence.split.reverse.join ' '
end
=end

def reverse_sentence(sentence)
  words = sentence.split
  words_count = words.size
  return '' if words_count.zero?
  return sentence if words_count <= 1

  mid_index = words_count / 2 - 1
  0.upto(mid_index) { |index| words[index], words[-1 - index] = words[-1 - index], words[index] }
  words.join ' '
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
