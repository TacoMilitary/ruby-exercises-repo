class Card
  include Comparable

  RANK_COMPARE_ORDER = [*(2..10), 'Jack', 'Queen', 'King', 'Ace'].freeze
  SUIT_COMPARE_ORDER = %w[Diamonds Clubs Hearts Spades].freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    rank_compare_value <=> other.rank_compare_value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def rank_compare_value
    RANK_COMPARE_ORDER.index(rank)
  end

  def suit_compare_value
    SUIT_COMPARE_ORDER.index(suit)
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = new_deck
  end

  def draw
    drawn_card = cards.pop
    reset_deck_if_empty
    drawn_card
  end

  private

  def new_deck
    SUITS.each_with_object([]) do |suit, new_deck|
      RANKS.each { |rank| new_deck << Card.new(rank, suit) }
    end.shuffle!
  end

  def reset_deck_if_empty
    self.cards = new_deck if cards.empty?
  end

  attr_accessor :cards
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
