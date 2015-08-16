require_relative 'deck'
require_relative 'player'
require_relative 'view'

class RubyBlackjack

  def initialize
    @deck = Deck.new
    @player = Player.new
    @view = View.new
    @round = 1
  end

  def run
    @view.welcome_screen
    @player.name = @view.get_user_input
    play_game
  end

  def play_game
    while playing? && !bankrupt?
      setup_the_game

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

  def player_turn
    @view.show_player_total @deck.player_cards_total
    player_move = @view.get_user_input
    hit_or_stay? player_move
  end

  def hit_or_stay? player_move
    case player_move.chars.first.downcase
    when 'h'
      @deck.player_hit
    when 's'
      @player_stay = true
    else
      @view.bad_input
      player_turn
    end
  end

  def dealer_turn
    if @deck.dealer_cards_total > 16
      @dealer_stay = true
    else
      @deck.dealer_hit
    end
    sleep 1
  end

  def show_winner
    if player_busted?
      @view.player_busted
    elsif dealer_busted?
      @view.dealer_busted
    elsif @deck.player_cards_total > @deck.dealer_cards_total
      @view.player_win @deck.player_cards_total, @deck.dealer_cards_total
    elsif @deck.dealer_cards_total > @deck.player_cards_total
      @view.dealer_win @deck.dealer_cards_total, @deck.player_cards_total
    else
      @view.draw
    end
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
