class Board
  attr_reader :board

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  class << self
    attr_reader :board
  end

  def reset
    @board.clear
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_HORIZONTAL = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ].freeze

  WIN_DIAGONAL = [
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  WIN_VERTICAL = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ].freeze

  def position_taken?(input)
    @board[input] == 'X' || @board[input] == 'O'
  end

  def move(position, token = 'X')
    @board[position] = token
  end

  def full?
    @board.any? { |index| index.nil? || index == ' ' }
  end

  def horizontals?(input)
    arr_horizontals1 = WIN_HORIZONTAL[0]
    arr_horizontals2 = WIN_HORIZONTAL[1]
    arr_horizontals3 = WIN_HORIZONTAL[2]

    horizontals1 = arr_horizontals1.all? { |i| @board[i] == input }
    horizontals2 = arr_horizontals2.all? { |i| @board[i] == input }
    horizontals3 = arr_horizontals3.all? { |i| @board[i] == input }

    return true if horizontals1 || horizontals2 || horizontals3
  end

  def diagonals?(input)
    arr_diagonal1 = WIN_DIAGONAL[0]
    arr_diagonal2 = WIN_DIAGONAL[1]
    diagonal1 = arr_diagonal1.all? { |i| @board[i] == input }
    diagonal2 = arr_diagonal2.all? { |i| @board[i] == input }

    return true if diagonal1 || diagonal2
  end

  def verticals?(input)
    arr_vertical1 = WIN_VERTICAL[0]
    arr_vertical2 = WIN_VERTICAL[1]
    arr_vertical3 = WIN_VERTICAL[2]
    vertical1 = arr_vertical1.all? { |i| @board[i] == input }
    vertical2 = arr_vertical2.all? { |i| @board[i] == input }
    vertical3 = arr_vertical3.all? { |i| @board[i] == input }

    return true if vertical1 || vertical2 || vertical3
  end

  def won?(input)
    horizontals?(input) || diagonals?(input) || verticals?(input)
  end

  def check_for_game_termination?(input)
    won?(input) || full?
  end
end
