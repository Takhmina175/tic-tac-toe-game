#!/usr/bin/env ruby
puts 'Hello World!'
class Test
  attr_accessor :board, :input

  def initialize
      @input = input
      @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts " ----------- "
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts " ----------- "
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def player_input
    puts "Choose a spot"
    @input = gets.chomp.to_i-1 
    current_player(@input, token = 'X')
    turn(@input) 
  end

  def turn(num)
    if (turn_count() % 2).zero?
      @board[num] = 'X'
    else
      @board[num] = 'O'
    end
  end

  def turn_count
    taken = 0
    @board.each do |i|
      if i.include?('X') || i.include?('O') 
        taken += 1
      end
    end
    taken
  end
    
  def current_player(index, token = 'X')
    @board[index] = token
  end


  def check_position?(index)
      @board[index] == "X" ||  @board[index] == "O" 
  end

  def valid_move?(index)
     if index.between?(0, 8) && !check_position?(index)
     end
  end

  def check_valid_pos?
    if check_position?(@input) || !valid_move?(@input)
      puts 'Enter a valid number'
    end
  end

def wining?
  if @board[0] == 'X' && @board[1] == 'X' && @board[2] == 'X'|| 
    @board[3] == 'X' && @board[4] == 'X' && @board[5] == 'X'|| 
    @board[6] == 'X' && @board[7] == 'X' && @board[8] == 'X'
      puts 'You won'
  else
    check
  end
end

  def check
      player_input
      check_valid_pos?
      display_board
      wining?
  end

end

 game=Test.new
 game.check
