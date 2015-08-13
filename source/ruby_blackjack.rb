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
    @view.welcome_screen
    @player.name = @view.get_user_input
    play_game
  end

  def play_game
    while playing? && !bankrupt?
      # play the game
    end
    leave_the_club
  end

  private

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
