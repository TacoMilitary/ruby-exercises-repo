# frozen_string_literal: false

# Takes a word upon instantiation, then can be used to calculate
# scrabble score for the passed word.
class Scrabble
  TILE_SCORES = {
    %w[a e i o u l n r s t] => 1,
    %w[d g] => 2,
    %w[b c m p] => 3,
    %w[f h v w y] => 4,
    %w[k] => 5,
    %w[j x] => 8,
    %w[q z] => 10
  }.freeze

  attr_reader :word, :score

  def self.score(word)
    word.chars.tally.sum { |(letter, count)| tile_score(letter) * count }
  end

  def initialize(word)
    @word = word.to_s
    @score = self.class.score @word
  end

  def self.tile_score(letter)
    TILE_SCORES.find { |(list)| list.include? letter.downcase }&.last || 0
  end

  private_class_method :tile_score
end
