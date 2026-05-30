# frozen_string_literal: true

=begin
def repeater(string)
  string.chars.map! { |chr| chr * 2 }.join
end

def repeater(string)
  string.each_char.with_object(''.dup) { |chr, new_str| new_str << chr * 2 }
end
=end

def repeater(str)
  str.gsub(/(.)/, '\1\1')
end

p repeater('Hello') == 'HHeelllloo'
p repeater('Good job!') == 'GGoooodd  jjoobb!!'
p repeater('') == ''
