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
