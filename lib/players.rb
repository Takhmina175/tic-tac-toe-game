class Player
  attr_accessor :curr_player

  def self.players_name
    gets.chomp
  end

  def self.input_range?(input)
    input.negative? || input > 8
  end

  def self.switch_input(curr_input = 'X')
    if curr_input == 'X'
      'O'
    else
      'X'
    end
  end
end
