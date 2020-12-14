class Player
attr_accessor :board, :curr_player

  def initialize(board, curr_player)
    @board = board
    @curr_player = curr_player
  end

  def players_name
    puts 'Hi player1, what is your name?'
    @player_x = gets.chomp

    puts 'Hi player2, what is your name?'
    @player_y = gets.chomp

    @current_player = @player_x
    player_input
  end

  def switch_players
    @current_player = if @current_player == @player_x
                        @player_y
                      else
                        @player_x
                      end
    player_input
  end

  def player_turn(num)
    @board[num] = if (num % 2).zero?
                    'O'
                  else
                    'X'
                  end
  end
end
