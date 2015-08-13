class View

  def welcome_screen
    reset_screen!
    view_header
    puts 'Welcome to Ruby Blackjack'
    puts <<-eos

    eos
    puts "What's yo name, playa?"
  end

  def deal_round? player
    reset_screen!
    view_header
    puts "You have $#{player.cash} #{player.name}."
    puts ""
    puts 'Deal the next round?'
  end

  def thrown_out
    reset_screen!
    view_header
    puts '"Come back when you got money sucka!"'
    puts ""
    puts 'You have been thrown out of the club.'
  end

  def walked_out cash
    reset_screen!
    view_header
    puts '"Come back anytime!"'
    puts ""
    puts "You've left the club with $#{cash}."
  end

  def get_user_input
    gets.chomp
  end

  private

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
