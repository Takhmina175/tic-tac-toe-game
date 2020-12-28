#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/players'
boards = Board.new
@boards = boards

def display_board
  puts " #{@boards.board[0]} | #{@boards.board[1]} | #{@boards.board[2]} "
  puts ' ----------- '
  puts " #{@boards.board[3]} | #{@boards.board[4]} | #{@boards.board[5]} "
  puts ' ----------- '
  puts " #{@boards.board[6]} | #{@boards.board[7]} | #{@boards.board[8]} "
end

@curr_input = Player.switch_input(@curr_input)

def switch_names(curr_player)
  if curr_player == @x
    @y
  else
    @x
  end
end

def input
  gets.chomp.to_i - 1
end

def players_name
  puts 'Hi player1, what is your name?'
  @x = gets.chomp
  @x.empty?

  while @x.empty?
    puts "You didn't set your name, please enter your name"
    name = gets.chomp
    @x = name
  end

  puts 'Hi player2, what is your name?'
  @y = gets.chomp
  @y.empty?

  while @y.empty?
    puts "You didn't set your name, please enter your name"
    name = gets.chomp
    @y = name
  end

  @current_player = @x
end

def play_again
  puts "if you want to continue playing enter 'Y' else 'N' > "
  response = gets.chomp.capitalize
  if response == 'Y'
    @boards.reset
    play_game
  else
    puts 'Thank you for game'
  end
end

def play_game
  while @boards.full?
    puts "#{@current_player} choose a spot"
    index = input
    if Player.input_range?(index)
      puts 'Enter number within a range of 1-9'
    elsif @boards.position_taken?(index)
      puts 'Sorry, that space is not empty! Please choose another number'
    else
      @boards.move(index, @curr_input)
      display_board
      @current_player = switch_names(@current_player)
    end
    break if @boards.won?(@curr_input)

    @curr_input = Player.switch_input(@curr_input)
  end
  winning_cond
end

def winning_cond
  if @boards.won?(@curr_input)
    puts "Congratulation #{switch_names(@current_player)}, You Won!"
  else
    puts "Cat's Game!"
  end
  play_again
end

players_name
play_game
