#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/players'
boards = Board.new
@boards = boards

@x_marker = 'X'
@o_marker = 'O'

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

def switch_marker(marker)
  if marker == @x_marker
    @o_marker
  else
    @x_marker
  end
end

def input
  gets.chomp.to_i - 1
end

def players_name
  puts 'Hi player1, what is your name?'
  @x = gets.chomp.strip
  @x.empty?

  while @x.empty?
    puts "You didn't set your name, please enter your name"
    name = gets.chomp.strip
    @x = name
  end

  puts 'Hi player2, what is your name?'
  @y = gets.chomp.strip
  @y.empty?
  while @y.empty?
    puts "You didn't set your name, please enter your name"
    name = gets.chomp.strip
    @y = name
  end
  @current_player = @x
  @marker = @x_marker
end

def play_again
  puts "if you want to continue playing enter 'Y' else 'N' > "
  response = gets.chomp.capitalize
  if response == 'Y'
    @boards.reset
    @current_player = @x
    @marker = @x_marker
    play_game
  else
    puts 'Thank you for game'
  end
end

def play_game
  while @boards.full?
    display_board
    puts "#{@current_player} place '#{@marker}' on the board’s empty cell  by entering 1 - 9"
    index = input
    if Player.input_range?(index) || @boards.position_taken?(index)
      play_game
    else
      @boards.move(index, @curr_input)
      @current_player = switch_names(@current_player)
      @marker = switch_marker(@marker)
    end
    break if @boards.won?(@curr_input)

    @curr_input = Player.switch_input(@curr_input)
  end
  winning_cond
end

def winning_cond
  if @boards.won?(@curr_input)
    puts "Congratulation #{switch_names(@current_player)}, '#{switch_marker(@marker)}' Won!"
  else
    puts "Cat's Game!"
  end
  play_again
end

players_name
play_game
