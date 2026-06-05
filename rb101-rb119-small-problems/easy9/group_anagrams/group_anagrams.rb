# frozen_string_literal: true

def anagram_in_group?(word, group)
  group.any? do |other_word|
    !word.equal?(other_word) && (word.chars - other_word.chars).empty?
  end
end

def group_anagrams(words)
  anagram_groups = {}
  words.each do |word|
    group_key = word.chars.sort.join.to_s
    if anagram_groups[group_key]
      anagram_groups[group_key] << word
    else
      anagram_groups[group_key] = [word]
    end
  end
  anagram_groups.values
end

words = %w[demo none tied evil dome mode live
           fowl veil wolf diet vile edit tide
           flow neon]

p group_anagrams(words)
