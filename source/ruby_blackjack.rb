require_relative 'deck'
require_relative 'player'
require_relative 'view'

class RubyBlackjack

  def initialize
    @deck = Deck.new
    @player = Player.new
    @view = View.new
  end

  def run
    @view.welcome_screen @deck.blackjack
    @player.name = @view.get_user_input
    play_game
  end

  def play_game
    while !bankrupt? && playing?
      setup_the_game
      place_player_bet

      until player_busted? || @player_stay
        show_cards
        player_turn
      end

      @deck.reveal_dealers_card

      unless player_busted?
        until dealer_busted? || @dealer_stay
          show_cards
          dealer_turn
        end
      end

      show_cards
      show_winner
    end
    leave_the_club
  end

  private

  def setup_the_game
    @deck.deal_original_cards
    @player_stay = false
    @dealer_stay = false
  end

  def place_player_bet
    # fill me in!
  end

  def player_turn
    # fill me in!
    hit_or_stay? player_move
  end

  def hit_or_stay? player_move
    # fill me in!
  end

  def dealer_turn
    # fill me in!
    sleep 1
  end

  def show_winner
    # fill me in!
    sleep 1
  end

  def show_cards
    @view.deal_cards @deck.cards_in_play
  end

  def dealer_busted?
    @deck.dealer_cards_total > 21
  end

  def player_busted?
    @deck.player_cards_total > 21
  end

  def playing?
    @view.deal_round? @player
    answer = @view.get_user_input
    answer.chars.first.downcase == 'y'
  end

  def bankrupt?
    @player.cash <= 0
  end

  def leave_the_club
    bankrupt? ? @view.thrown_out : @view.walked_out(@player.cash)
  end
end
