#!/usr/bin/env ruby
class Game
  require_relative '../lib/board'
  require_relative '../lib/players'

  attr_accessor :curr_player, :board

  def initialize
    @boards = Board.new
    @player = Player.new
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @curr_player = curr_player
    @curr_input = 'X'
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
    @curr_player = @player_x
    play
  end

  def switch_names
    @curr_player = if @curr_player == @player_x
                     @player_y
                   else
                     @player_x
                   end
  end

  def player_input
    puts "#{@curr_player} choose a spot"
    index = gets.chomp.to_i - 1
    if index.negative? || index > 8
      puts 'Enter number within a range of 1-9'
      player_input
    elsif @boards.position_taken?(@board, index)
      puts 'Position is already taken choose another number'
      player_input
    else
      @boards.move(@board, index, @curr_input)
      display_board
      switch_names
    end
  end

  def play
    i = 0
    while i < 9
      player_input
      break if @boards.won?(@board, @curr_input)

      @curr_input = @player.switch_input(@curr_input)
      i += 1
    end
    if @boards.won?(@board, @curr_input)
      puts "Congratulation #{switch_names}, You Won!"
    else
      puts "Cat's Game!"
    end
  end
end

player = Game.new
player.players_name
