class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(words)
    sorted_letters = word.downcase.chars.sort

    words.select do |other_word|
      other_word.downcase != word.downcase &&
        other_word.downcase.chars.sort == sorted_letters
    end
  end
end
