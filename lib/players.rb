class Player
  attr_accessor :curr_player

  def initialize
    @curr_player = curr_player
  end

  def players_name
    puts 'Hi player1, what is your name?'
    @player_x = gets.chomp
    puts 'Hi player2, what is your name?'
    @player_y = gets.chomp
    @curr_player = @player_x
  end

  def switch_names
    @curr_player = if @curr_player == @player_x
                     @player_y
                   else
                     @player_x
                   end
  end

end
