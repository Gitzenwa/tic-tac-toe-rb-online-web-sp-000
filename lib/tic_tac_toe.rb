WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom Row
  [0,3,6], # Left columns
  [1,4,7], # Middle column
  [2,5,8], # Right coulum
  [0,4,8], # left diagonal
  [2,4,6], # right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken? (board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
     true
  end
end

def valid_move? (board, index)
  #if statement to see if the position is taken
  #when the position is taken, return false
  if position_taken?(board, index)
    return false
  elsif position_taken?(board, index) != true && index.between?(0,8)
    true
  end
end

def turn(board)

  puts "Please enter 1-9:"

  #get input
  input = gets.strip
  #convert input to index
  index = input_to_index(input)
  #if index is valid
  if valid_move?(board, index)
  #make the move for input
    move(board, index, current_player(board))
    display_board(board)
  #else
  else
    #ask for input again until you get a valid input
    display_board(board)
    turn(board)
  end
end

def turn_count(board)
  board.count{|turn| turn == "X"|| turn == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|index| index == "X" || index == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif
    puts
  end
end
