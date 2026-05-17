# frozen_string_literal: true

ALPHABET = ('a'..'z')

def cleanup(string)
  cleaned = ''.dup
  space_allowed = true

  string.each_char do |char|
    if ALPHABET.include?(char.downcase)
      cleaned << char
      space_allowed = true
    else
      cleaned << ' ' if space_allowed
      space_allowed = false
    end
  end

  cleaned
end

p cleanup("---what's my +*& line?")
p cleanup("---what's my +*& line?") == ' what s my line '
