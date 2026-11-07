def vowel_indices(word)
  word.size.times.filter_map { |idx| idx.next if /[aeiouy]/i.match?(word[idx])  }
end

# puts vowel_indices('super')
puts vowel_indices('8fNzAtyBIZHUKfidTJC')
# 8fNzAtyBIZHUKfidTJC
# 5, 7, 9, 12, 15