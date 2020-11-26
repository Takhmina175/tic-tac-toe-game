#!/usr/bin/env ruby
puts "Hello World!"
class TicTacToe
   attr_accessor :board
   def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end
    def display_board
        puts "#{@board[0]} |#{@board[1]} |#{@board[2]}"
        puts "---------------"
        puts "#{@board[3]} |#{@board[4]} |#{@board[5]}"
        puts "---------------"
        puts "#{@board[6]} |#{@board[7]} |#{@board[8]}"
    end
    def user_input
        puts "Choose a spot"
        input = gets.chomp.to_i - 1
    end
    def current_player(user_input)
        if @board[user_input] == 'X' 
        @board[user_input] = "X"
        else
            @board[user_input] = "O"
        end
    end

    def board_position?(input)
        if @board[input] == 'X' || @board[input] == 'O' 
        end
    end

    def valid_move?(input)
        input.between?(0, 8) && !board_position?(input)
    end

    def board_full?
        index = @board.length-1
            if index > 8
           puts "Game is over"
            end
        end
    end
    def winner?(@board, current_player)
            if @board[0] == player && @board[1] == player && @board[2] == player||
               @board[3] == player && @board[4] == player && @board[5] == player||
               @board[6] == player && @board[7] == player && @board[8] == player
                puts "You won the Game!"
    end

end


