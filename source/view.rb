class View

  def welcome_screen cards
    reset_with_header
    puts 'Welcome to Ruby Blackjack'
    draw_cards_on_screen cards
    puts "What's your name, playa?"
  end

  def deal_round? player
    puts ''
    puts "You have $#{player.cash} #{player.name}."
    puts ""
    puts 'Deal the next round?'
  end

  def deal_cards cards_in_play
    reset_with_header
    puts "Dealer's cards:"
    draw_cards_on_screen cards_in_play[:dealer]

    puts "Your cards:"
    draw_cards_on_screen cards_in_play[:player]
  end

  def show_player_total player_points
    puts "You have #{player_points}."
    puts 'Hit or stay?'
  end

  def thrown_out
    reset_with_header
    puts '"Come back when you got money sucka!"'
    puts ""
    puts 'You have been thrown out of the club.'
  end

  def walked_out cash
    reset_with_header
    puts '"Come back anytime!"'
    puts ""
    puts "You've left the club with $#{cash}."
  end

  def bad_input
    puts 'Your answer does not amuse the house.'
    puts ''
  end

  def get_players_bet
    puts ''
    puts 'Place your bet:'
  end

  def player_busted
    puts 'Player busted.'
  end

  def dealer_busted
    puts 'Dealer busted.'
  end

  def player_win player_total, dealer_total
    puts "Player wins. #{player_total} to #{dealer_total}."
  end

  def dealer_win dealer_total, player_total
    puts "Dealer wins. #{dealer_total} to #{player_total}."
  end

  def draw
    puts 'Draw.'
  end

  def get_user_input
    gets.chomp
  end

  private

  def draw_cards_on_screen cards
    puts ''
    i = 0
    cards.first.height.times do
      cards.each do |card|
        if card.flipped
          print card.flipped_view[i][0] + '   '
        else
          print card.view[i][0] + '   '
        end
      end
      puts ''
      i += 1
    end
    puts ''
  end

  def reset_with_header
    reset_screen!
    view_header
  end

  def view_header
    puts '$' + '-21-$' * 5
  end

  def reset_screen!
    clear_screen!
    move_to_home!
  end

  def clear_screen!
    print "\e[2J" # clears the screen
  end

  def move_to_home!
    print "\e[H" # moves the cursor back to the upper left
  end
end
