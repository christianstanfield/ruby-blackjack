require_relative 'card'

class Deck
  attr_reader :dealer_cards, :player_cards

  def initialize
    @cards = []
    build_deck
    @cards.shuffle!
  end

  def deal_original_cards
    @dealer_cards = @cards.pop 2
    @dealer_cards.first.flipped = true
    @player_cards = @cards.pop 2
  end

  def reveal_dealers_card
    @dealer_cards.first.flipped = false
  end

  def player_hit
    @player_cards << @cards.pop
  end

  def dealer_hit
    @dealer_cards << @cards.pop
  end

  def cards_in_play
    { dealer: dealer_cards, player: player_cards }
  end

  def player_cards_total
    player_cards.map(&:point_value).inject(:+)
  end

  def dealer_cards_total
    dealer_cards.map(&:point_value).inject(:+)
  end

  private

  def build_deck
    Card::SUITS.each_key do |suit|
      Card::VALUES.each_key do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
end
