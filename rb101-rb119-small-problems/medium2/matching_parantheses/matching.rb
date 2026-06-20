# frozen_string_literal: true

OPENING_PARANTHESE = '('
CLOSING_PARANTHESE = ')'
EXCLUDE_NON_PARANTHESES = '^)('

def balanced?(text)
  only_parantheses = text.delete EXCLUDE_NON_PARANTHESES
  return false if only_parantheses.size.odd?

  unclosed_parantheses = 0
  only_parantheses.each_char do |char|
    case char
    when OPENING_PARANTHESE then unclosed_parantheses += 1
    when CLOSING_PARANTHESE
      return false if unclosed_parantheses.zero?

      unclosed_parantheses -= 1
    end
  end

  unclosed_parantheses.zero?
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
