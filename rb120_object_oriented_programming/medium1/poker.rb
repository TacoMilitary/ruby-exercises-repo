require_relative 'deck_of_cards'

class PokerHand
  CARDS_IN_HAND = 5

  FACE_RELATIVE_VALUE = 11

  ROYAL_FLUSH_RANKS = ['Ace', 'King', 'Queen', 'Jack', 10]
  FULL_HOUSE_DISTRIBUTION = [3, 2].freeze
  FOUR_OF_A_KIND_DISTRIBUTION = [4, 1].freeze
  THREE_OF_A_KIND_DISTRIBUTION =  [3, 1, 1].freeze
  TWO_PAIR_DISTRIBUTION = [2, 2, 1].freeze
  PAIR_DISTRIBUTION = [2, 1, 1, 1].freeze

  attr_reader :cards

  def initialize(deck)
    @cards = init_cards(deck)
  end

  def print
    puts cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def init_cards(deck)
    cards = []
    CARDS_IN_HAND.times { cards << deck.draw }
    cards
  end

  def royal_flush?
    suits_uniq.size == 1 && include_ranks?(*ROYAL_FLUSH_RANKS)
  end

  def straight_flush?
    suits_uniq.size == 1 && cards_in_sequence?
  end

  def four_of_a_kind?
    rank_distribution? FOUR_OF_A_KIND_DISTRIBUTION
  end

  def full_house?
    rank_distribution? FULL_HOUSE_DISTRIBUTION
  end

  def flush?
    suits_uniq.size == 1 && !cards_in_sequence?
  end

  def straight?
    suits_uniq.size > 1 && cards_in_sequence?
  end

  def three_of_a_kind?
    ranks_uniq.size == 3 &&
      rank_distribution?(THREE_OF_A_KIND_DISTRIBUTION)
  end

  def two_pair?
    rank_distribution? TWO_PAIR_DISTRIBUTION
  end

  def pair?
    rank_distribution? PAIR_DISTRIBUTION
  end

  def cards_in_sequence?
    rank_values = rank_values()
    highest_rank = rank_values.max
    end_value = highest_rank - 3
    sequence = (end_value..highest_rank)

    sequence.all? { |value| rank_values.include? value }
  end

  def include_ranks?(*check_ranks)
    hand_ranks = ranks_uniq
    check_ranks.all? { |rank| hand_ranks.include? rank }
  end

  def rank_distribution?(distribution)
    remainining_rank_counts = ranks.tally.values
    distribution.each do |count|
      index = remainining_rank_counts.index(count)
      return false unless index

      remainining_rank_counts.delete_at index
    end

    true
  end

  def suits
    cards.map(&:suit)
  end

  def ranks
    cards.map(&:rank)
  end

  def suits_uniq
    suits.uniq
  end

  def ranks_uniq
    ranks.uniq
  end

  def rank_values
    cards.map { |card| card.number_value }
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
