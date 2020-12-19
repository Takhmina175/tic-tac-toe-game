#!/usr/bin/env ruby
class Game
  require_relative '../lib/board'
  require_relative '../lib/players'

  attr_accessor :curr_input, :curr_player

  def initialize
    @board = Board.new
    @player = Player.new
    @curr_player = curr_player
    @curr_input = 'X'
  end

  def call_for_players
    @curr_player = @player.players_name
    play
  end

  def switch_input
    @curr_input = if @curr_input == 'X'
                    'O'
                  else
                    'X'
                  end
  end

  def player_input
    puts "#{@curr_player} choose a spot"
    index = gets.chomp.to_i - 1
    if index.negative? || index > 8
      puts 'Enter number within a range of 1-9'
      player_input
    elsif @board.position_taken?(index)
      puts 'Position is already taken choose another number'
      player_input
    else
      @board.move(index, @curr_input)
      @board.display_board
      @curr_player = @player.switch_names
    end
  end

  def play
    i = 0
    while i < 9
      player_input
      break if @board.won?(@curr_input)

      switch_input
      i += 1
    end
    if @board.won?(@curr_input)
      puts "Congratulation #{@player.switch_names}, You Won!"
    else
      puts "Cat's Game!"
    end
  end
end

player = Game.new
player.call_for_players
