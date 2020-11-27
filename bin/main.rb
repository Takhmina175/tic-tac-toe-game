#!/usr/bin/env ruby
puts "Hello World!"
class Player
    attr_accessor :board
  
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts " ----------- "
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts " ----------- "
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end   

def turn?(num)
  if num < 0 || num > 8 
    user_input
  elsif position_taken?(num)
    puts "position is already taken choose another number"
    user_input
  elsif turn_count() % 2 == 0
    @board[num] = "X"
  else
    @board[num] = "O"
  end
end

def winner?(curr_player)
  if @board[0] == curr_player && @board[1] == curr_player && @board[2] == curr_player
  end
end

def turn_count
  taken = 0
  @board.each do |i|
    if i == "X" || i == "O"
      taken += 1
    end
  end
  return taken
end

def position_taken?(input)
  @board[input] == "X" || @board[input] == "O"
end

def user_input
  puts "Choose a spot"
  input = gets.chomp.to_i-1 
  if turn?(input)
    display_board
  elsif winner?(input)
    puts "You won the game"
  end
  user_input
end
  
end
player = Player.new
player.user_input


