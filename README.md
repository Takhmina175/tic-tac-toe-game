# tic-tac-toe-game
![](https://img.shields.io/badge/Microverse-blueviolet)
![](https://img.shields.io/badge/TicTacToe-purple)
![](https://img.shields.io/badge/Ruby-red)

# Building The Tic-Tac-Toe Game With Ruby
How The Game works
    1.	Two players are involved in the game
    2.	They start with an empty nine spaces in the board
    3.	Players will take the turn to put a marker on the board
    4.	The first player starts by selecting an empty slot between 1-9 on a 3 x 3 grid
    5.	The selected slot will be marked as 'X.' 
    6.	In the next turn, the second player will select another space, and the      cell will be marked with 'O'
    7. The game is won when one player achieves three markers in a row - horizontally, vertically, or diagonally
    8.	The program will respond in conditions when the position is taken or when the player selects a number out of the given range or no winner. 

## Built With

- ![](https://img.shields.io/badge/RubyOOP-red)


##  Setting Up The Game In Bin

- Creating a repository in the Github and cloning it in your local machine
- Create two directory bin, lib on your terminal
- Create a main.rb file in the bin directory and run it with `./main.rb.` 


## Rules of the game

- The game is played on a grid that's 3 squares by 3 squares
- One player is X and the other is O
- The first player to get 3 of either X or O marks in a row (up, down, across, or diagonally) is the winner
- When all 9 squares are full, the game is over either by draw or by a player winning.

## Setting Up The Board
puts "Welcome to Tic Tac Toe!"
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def display_board(board)
  puts " # | # | # "
  puts "-----------"
  puts " # | # | # "
  puts "-----------"
  puts " # | # | # "
end

## Author

**Mina**

- GitHub: [@Takhmina175](https://github.com/Takhmina175)
- Twitter: [@Takhmin73630110](https://twitter.com/Takhmin73630110)
- LinkedIn: [Takhmina Makhkamova](https://www.linkedin.com/in/takhmina-makhkamova-7628136b/)

##  Contributing

Contributions and issues are welcome!

## Show your support

Give a ⭐️ if you like this project!

## License

This project is [MIT](./LICENSE) licensed.

## Acknowledgements

- [Microverse](https://microverse.org)
- [The Odin Project](https://www.theodinproject.com/)