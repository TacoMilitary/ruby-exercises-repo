# frozen_string_literal: true

def swap(sentence)
  str_array = sentence.split.each do |word|
    last_char = word[-1]
    word[-1] = word.chr
    word[0] = last_char
  end

  str_array.join ' '
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
