class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = @current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?( index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  turn_counter = 0
  @board.each do |value|
    if value == "X" || value == "O"
turn_counter += 1
end
end
return turn_counter
end

def current_player
num = turn_count
if num % 2 == 0
  return "X"
else
  return "O"
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
   if valid_move?(board, index)
    move(board, index, current_player(board))
     display_board(board)
   else
     turn(board)
  end
  end

def play
  won?
  draw?
while over? == false do
  turn
end
if won?
  puts "Congratulations #{winner(@board)}!"
end
if draw?
  puts "Cat's Game!"
end
end

end
