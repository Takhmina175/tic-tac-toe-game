class Board
attr_accessor :board, :curr_player

  def initialize
    @curr_player = curr_player
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

    WIN_HORIZONTAL = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ]
    WIN_VERTICAL = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]
    WIN_DIAGONAL = [
    [0, 4, 8],
    [2, 4, 6]

    ]

    def is_location_valid?(index)
        return true if within_valid_range? && available_spot?(index)
    end

    def within_valid_range?(index)
        unless index.between?(0, 8)
            puts 'Enter a number withing a range of 1 - 9'
        end
    end

    def available_spot?(index)
        unless @board[index] == 'X' || @board[index] == 'O' 
            puts 'No available spot in this position'
        end
    end



end