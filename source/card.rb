class Card
  attr_reader :value
  attr_accessor :flipped

  SUITS =   { Spades: '♠',
              Diamonds: '♦',
              Hearts: '♥',
              Clubs: '♣' }

  VALUES =  { '2' => 2,
              '3' => 3,
              '4' => 4,
              '5' => 5,
              '6' => 6,
              '7' => 7,
              '8' => 8,
              '9' => 9,
              '10' => 10,
              Jack: 10,
              Queen: 10,
              King: 10,
              Ace: 11 }

  def initialize suit, value
    @suit = suit
    @value = value
    @flipped = false
  end

  def point_value
    VALUES[value]
  end

  def height
    view.length
  end

  def view
    if value == '10'
      display_value1 = display_value2 = value
    else
      display_value1 = value[0] + ' '
      display_value2 = ' ' + value[0]
    end

    [['┌─────────┐'],
     ['│' + display_value1 + '       │'],
     ['│         │'],
     ['│         │'],
     ['│    ' + SUITS[@suit] + '    │'],
     ['│         │'],
     ['│         │'],
     ['│       ' + display_value2 + '│'],
     ['└─────────┘']]
  end

  def flipped_view
    [['┌─────────┐'],
     ['│░░░░░░░░░│'],
     ['│░░RUBY░░░│'],
     ['│░░░░░░░░░│'],
     ['│░░BLACK░░│'],
     ['│░░░░░░░░░│'],
     ['│░░JACK░░░│'],
     ['│░░░░░░░░░│'],
     ['└─────────┘']]
  end
end
