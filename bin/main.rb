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
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def player_input
    puts 'Choose a spot'
    @input = gets.chomp.to_i - 1
    current_player(@input)
    turn(@input)
  end

  def turn(num)
    @board[num] = if (turn_count % 2).zero?
                    'X'
                  else
                    'O'
                  end
  end

  def turn_count
    taken = 0
    @board.each do |i|
      taken += 1
      if i.include?('X') || i.include?('O')
      end
    end
    taken
  end

  def current_player(index)
    @board[index] = 'X'
  end

  def check_position?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end

  def valid_move?(index)
    if index.between?(0, 8) && !check_position?(index)
    end
  end

  def check_valid_pos?
    return unless check_position?(@input) || !valid_move?(@input)

    puts 'Enter a valid number'
  end

  def wining?
    WIN_COMBINATION.each do |single_win|
      win_index1 = single_win[0]
      win_index2 = single_win[1]
      win_index3 = single_win[2]

      position1 = @board[win_index1]
      position2 = @board[win_index2]
      position3 = @board[win_index3]

      return single_win if position1 == position2 && position2 == position3
    end
    false
  end

  def check
    player_input
    check_valid_pos?
    display_board
    wining?
  end
end

game = Test.new
game.check
