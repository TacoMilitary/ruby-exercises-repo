# frozen_string_literal: true

OPENING_PARANTHESE = '('
CLOSING_PARANTHESE = ')'
EXCLUDE_NON_PARANTHESES = '^)('

# Solution 1
=begin

def balanced?(text)
  only_parantheses = text.delete EXCLUDE_NON_PARANTHESES
  return false if only_parantheses.size.odd?

  unclosed_parantheses = 0
  only_parantheses.each_char do |char|
    case char
    when OPENING_PARANTHESE then unclosed_parantheses += 1
    else
      return false if unclosed_parantheses.zero?

      unclosed_parantheses -= 1
    end
  end

  unclosed_parantheses.zero?
end
=end

# Solution 2
=begin
PARANTHESE_REGEX = /\(|\)/

def balanced?(text)
  parantheses = text.scan PARANTHESE_REGEX
  return false if parantheses.size.odd?

  parantheses.reduce(0) do |unclosed_parantheses, char|
    if char == OPENING_PARANTHESE
      unclosed_parantheses.next
    else
      return false if unclosed_parantheses.zero?

      unclosed_parantheses - 1
    end
  end.zero?
end
=end

# Solution 3

PARANTHESES_PAIR = '()'

def balanced?(text)
  parantheses = text.delete EXCLUDE_NON_PARANTHESES
  return false if parantheses.size.odd?

  until parantheses.empty?
    removed_pair = parantheses.sub(PARANTHESES_PAIR, '')
    return false if removed_pair == parantheses
    parantheses = removed_pair
  end
  
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
