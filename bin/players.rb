class Player
  attr_accessor :curr_player, :curr_input

  def initialize
    @curr_player = curr_player
    @curr_input = 'X'
  end

  def players_name
    puts 'Hi player1, what is your name?'
    @player_x = gets.chomp

    puts 'Hi player2, what is your name?'
    @player_y = gets.chomp
    @curr_player = @player_y
    play
  end

  def switch_names
    @curr_player = if @curr_player == @player_x
                     @player_y
                   else
                     @player_x
                   end
  end

  def switch_input
    @curr_input = if @curr_input == 'X'
                    'O'
                  else
                    'X'
                  end
  end
end
