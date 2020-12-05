#!/usr/bin/env ruby
class Game
  attr_accessor :board, :x, :y, :player

  def initialize
    @player_x = x
    @player_y = y
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def player_input
    puts "#{@current_player} choose a spot"
    input = gets.chomp.to_i - 1

    if full?
      puts 'Board is full'

    elsif input.negative? || input > 8
      puts 'Enter number within a range of 1-9'
      player_input

    elsif position_taken?(input)
      puts 'Position is already taken choose another number'
      player_input
    elsif player_turn(input)
      display_board
      switch_players
    end
  end
end
player = Game.new
player.players_name
