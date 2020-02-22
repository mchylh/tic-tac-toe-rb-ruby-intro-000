# Define your WIN_COMBINATIONS constant
#WIN_COMBINATIONS is a constant but it’s the parent array to our the children array.
#parent_array => WIN_COMBINATIONS = [ children_arrays ]
#children_arrays => [0,1,2],[3,4,5],[6,7,8]...[6,4,2]
WIN_COMBINATIONS = [
[0,1,2], # top_row
[3,4,5], # middle_row
[6,7,8], # bottom_row
[0,3,6], # left_column
[1,4,7], # center_column
[2,5,8], # right_column
[0,4,8], # left_diagonal
[6,4,2] # right_diagonal
]

#build structure of the board
puts board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

#display_board method
def display_board
   puts row = ["   " "|" "   " "|" "   "]
   puts separator = "-----------"
   puts row
   puts separator
   puts row
 end

#prints arbitrary arrangements of the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  user_input.to_i-1
end

# define move method
def move(board, position, char="X")
  board[position] = char
end

# code your #position_taken? method here!
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method below.
def position_taken? (board, index)
  !(board[index].nil? || board[index] == " ")
end

#valid move
# code your #valid_move? method here
def valid_move?(board, index)
   if index.between?(0,8) && !position_taken?(board, index)
        puts "this is a valid move"
      return true
    else
      return false
   end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  #get the user input
  user_input = gets.strip
  #input to index
  index = input_to_index(user_input)
  token = current_player(board)

#check for validation
  if valid_move?(board,index)
    puts 'valid move'
    move(board, index, token)
    display_board(board)
   else
    puts 'try again'
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
   counter = 0
   board.each do |spaces|
      if spaces == "X" || spaces == "O"
         counter += 1
      end
   end
   counter
end

#define current player
def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end

#winning combo
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1] # value of board at win_index_1
      position_2 = board[win_index_2] # value of board at win_index_2
      position_3 = board[win_index_3] # value of board at win_index_3
      if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
        return win_combination
      end
    end
    return false
end
#position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
#The above code means to return first element (position_1) & make sure the position is taken by X or O

#define full board
def full?(board)
   board.all? {|i| i == "X" || i == "O"}
end

#draw method for tie game
def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end

#end game method if draw or won or full
def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end

#determine the winner
def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end
