# frozen_string_literal: true

DELIMITERS = {
  parantheses: {open: '(', close: ')'},
  s_quotes: {open: "'", close: "'"},
  d_quotes: {open: '"', close: '"'},
  brackets: {open: '[', close: ']'},
  curlys: {open: '{', close: '}'}
}

EXCLUDE_NON_DELIMITERS = "^()[]{}''\"\""

def delimiter?(char)
  DELIMITERS.values.any? { |delimiter| delimiter.value? char }
end

def find_pair(char)
  DELIMITERS.values.find { |delimiter| delimiter.value? char }
end

def is_opening?(char, delimiter_pair = nil)
  delimiter_pair = find_pair(char) unless delimiter_pair
  delimiter_pair[:open] == char
end

def is_closing?(char, delimiter_pair = nil)
  delimiter_pair = find_pair(char) unless delimiter_pair
  delimiter_pair[:close] == char
end

# Solution 2

def balanced?(text)
  only_delimiters = text.delete(EXCLUDE_NON_DELIMITERS).chars
  only_delimiters.each_with_object([]) do |delim, unclosed_list|
    delim_pair = find_pair delim
    twin_pair = delim_pair[:open] == delim_pair[:close]
    is_expected = unclosed_list.last == delim
    if twin_pair && is_expected
      unclosed_list.pop
    elsif is_opening?(delim, delim_pair)
      unclosed_list.push delim_pair[:close]
    else
      return false if unclosed_list.empty? || !is_expected

      unclosed_list.pop
    end
  end.empty?
end

# Solution 1
=begin
DELIMITER_REGEX = /(\(\)|''|""|\[\]|{})/

def balanced?(text)
  remaining_delimiters = text.delete EXCLUDE_NON_DELIMITERS
  loop do
    removed_last_pair = remaining_delimiters.sub(DELIMITER_REGEX, '')
    return true if removed_last_pair.empty?
    return false if removed_last_pair == remaining_delimiters
    remaining_delimiters = removed_last_pair
  end
end
=end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('("What" [is this])?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?('{Hey!}') == true
p balanced?('What ([is))) up(') == false
p balanced?('What ())(is() up') == false
p balanced?("Wh\"at\"(')' the flip!@") == false
