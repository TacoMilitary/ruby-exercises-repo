# frozen_string_literal: true

ALPHABET = ('a'..'z').to_a.freeze

SPELLING_BLOCKS = Array.new(13) { |place| ALPHABET[place] + ALPHABET[place + 13] }

# Solution 1
def block_word?(word)
  letters = word.downcase.tr('a-z', 'a-ma-m').chars
  letters == letters.uniq
end

# Solution 2
def block_word?(word)
  word = word.downcase
  SPELLING_BLOCKS.none? do |spelling_block| 
    word.size - word.delete(spelling_block).size >= 2
  end
end

# Solution 3 (recreated from someone else's)
def block_word?(word)
  goal_blocks = word.size
  blocks_used = SPELLING_BLOCKS.count { |spelling_block| word.match? /[#{spelling_block}]/i }
  goal_blocks == blocks_used
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('apples') == false
p block_word?('Baby') == false
