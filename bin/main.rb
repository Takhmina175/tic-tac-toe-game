#!/usr/bin/env ruby
class Game

  attr_accessor :board, :curr_player, :curr_input

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @curr_player = curr_player
    @curr_input = 'X'
  end

  WIN_DIAGONAL = [
  [0, 4, 8],
  [2, 4, 6]
  ]

  WIN_VERTICAL = [
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  
  def players_name
      puts "Hi player1, what is your name?"
        @player_x = gets.chomp

      puts "Hi player2, what is your name?"
        @player_y = gets.chomp
        @curr_player = @player_y 
        play
  end

  def player_input
    switch_names
    puts "#{@curr_player} choose a spot"
    index = gets.chomp.to_i - 1
    @board[index] = @curr_input
    display_board
  end

  def switch_names
    if @curr_player == @player_x 
        @curr_player = @player_y
    else
      @curr_player = @player_x
    end
  end

  def switch_input
    if @curr_input == 'X'
        @curr_input = 'O'
    else
      @curr_input = 'X'
    end
  end

  def horizontals?
    @board.all? { |i| @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] }
  end

  def diagonals?
    arr_diagonal_1 = []
    arr_diagonal_2 = []
    arr_diagonal_1 = WIN_DIAGONAL[0]
    arr_diagonal_2 = WIN_DIAGONAL[1]
    diagonal_1 = arr_diagonal_1.all? {|i| board[i] == "X" || board[i] == "O"}
    diagonal_2 = arr_diagonal_2.all? {|i| board[i] == "X" || board[i] == "O"}

    return true if diagonal_1 || diagonal_2 
  end

  def verticals?
    arr_vertical_1 = []
    arr_vertical_2 = []
    arr_vertical_1 = WIN_VERTICAL[0]
    arr_vertical_2 = WIN_VERTICAL[1]
    arr_vertical_3 = WIN_VERTICAL[2]
    vertical_1 = arr_vertical_1.all? {|i| board[i] == "X" || board[i] == "O"}
    vertical_2 = arr_vertical_2.all? {|i| board[i] == "X" || board[i] == "O"}
    vertical_3 = arr_vertical_3.all? {|i| board[i] == "X" || board[i] == "O"}
    vertical_1 || vertical_2 || vertical_3
  end

  def play
    for i in 0..8
      player_input
        if diagonals?
          puts "You won!"
        else
          switch_input
        end   
    end
  end
end

player = Game.new
player.players_name
