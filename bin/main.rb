#!/usr/bin/env ruby
class Game
  def player_input
    switch_names
    puts "#{@curr_player} choose a spot"
    index = gets.chomp.to_i - 1
    if index.negative? || index > 8
      puts 'Enter number within a range of 1-9'
      player_input
    elsif position_taken?(index)
      puts 'Position is already taken choose another number'
      player_input
    else
      @board[index] = @curr_input
      display_board
    end
  end

  def play
    i = 0
    while i < 9
      player_input
      break if won?(@curr_input)

      switch_input
      i += 1
    end
    if won?(@curr_input)
      puts 'Congratulation, You Won!'
    else
      puts "Cat's Game!"
    end
  end
end

player = Game.new
player.players_name
