require_relative 'card'

class Deck

  def initialize
    @cards = []
    build_deck
  end

  def deal round
    i = 0
    @cards.first.view.length.times do
      @cards.sample(round).each do |card|
        print card.view[i][0] + '   '
      end
      puts ''
      i += 1
    end
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
