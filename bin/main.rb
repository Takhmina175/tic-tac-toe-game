#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/players'
board = Board.new

curr_input = Player.switch_input(curr_input)

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

puts 'Hi player1, what is your name?'
@x = Player.players_name
puts 'Hi player2, what is your name?'
@y = Player.players_name
@current_player = @x

i = 0
while i < 9
  puts "#{@current_player} choose a spot"
  index = input
  if Player.input_range?(index)
    puts 'Enter number within a range of 1-9'

  elsif board.position_taken?(index)
    puts 'Position is already taken choose another number'
  else
    board.move(index, curr_input)
    board.display_board
    @current_player = switch_names(@current_player)
  end
  break if board.won?(curr_input)

  curr_input = Player.switch_input(curr_input)
  i += 1
end
if board.won?(curr_input)
  puts "Congratulation #{switch_names(@current_player)}, You Won!"
else
  puts "Cat's Game!"
end
