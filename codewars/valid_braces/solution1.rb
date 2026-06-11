# frozen_string_literal: false

def valid_braces(braces)
  opening_types = ['(', '[', '{']
  closing_types = [')', ']', '}']

  only_braces = braces.chars.select { |c| opening_types.include?(c) || closing_types.include?(c) }
  opened_braces = []

  only_braces.each do |brace|
    if opening_types.include? brace
      opened_braces << brace
    else
      return false if opened_braces.empty?

      closing_position = opening_types.index opened_braces.last
      return false if closing_types[closing_position] != brace

      opened_braces.pop
    end
  end

  opened_braces.empty?
end
