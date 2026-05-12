# frozen_string_literal: true

def short_long_short(string1, string2)
  short_first = [string1, string2].sort_by(&:length)

  short_first.first + short_first.last + short_first.first
end

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'
