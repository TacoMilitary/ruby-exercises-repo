def vowel_indices(word)
  word = word.downcase
  word.size.times.select { |idx| 'aeiou'.include? word[idx]  }.map(&:next)
end

# puts vowel_indices('super')
puts vowel_indices('8fNzAtyBIZHUKfidTJC')
# 8fNzAtyBIZHUKfidTJC
# 5, 9, 12, 15