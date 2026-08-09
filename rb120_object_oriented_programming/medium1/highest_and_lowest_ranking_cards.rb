class Card
  include Comparable

  RANK_COMPARE_ORDER = [*(2..10), 'Jack', 'Queen', 'King', 'Ace'].freeze
  SUIT_COMPARE_ORDER = ['Diamonds', 'Clubs', 'Hearts', 'Spades'].freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if suit == other_card.suit
      rank_compare_value <=> other_card.rank_compare_value
    else
      suit_compare_value <=> other_card.suit_compare_value
    end
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

# Test Cases
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
