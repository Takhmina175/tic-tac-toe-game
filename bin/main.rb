#!/usr/bin/env ruby
class Player
  attr_accessor :board

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def player_turn(num)
    @board[num] = if (num % 2).zero?
                    'O'
                  else
                    'X'
                  end
  end

  def position_taken?(input)
    @board[input] == 'X' || @board[input] == 'O'
  end

  def full?
    if @board.any? { |index| index.nil? || index == ' ' }
      false
    else
      true
    end
  end

  def turn
    puts 'Choose a spot'
    input = gets.chomp.to_i - 1

    if full?
      puts 'Board is full'

    elsif input.negative? || input > 8
      puts 'Enter number in the range of 1-9'
      turn

    elsif position_taken?(input)
      puts 'Position is already taken choose another number'
      turn
    elsif player_turn(input)
      display_board
      turn
    end
  end
end
player = Player.new
player.turn
