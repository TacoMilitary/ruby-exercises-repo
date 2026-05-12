# frozen_string_literal: true

def short_long_short(string1, string2)
  shortest, longest = [string1, string2].sort_by(&:length)
  shortest + longest + shortest
end

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'
