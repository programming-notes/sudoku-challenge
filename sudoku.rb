# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!

def solve(board_string)
  board_array = []
  9.times {board_array += [board_string.slice!(0, 9).split('')]}
  board_array = board_array.map do |array|
    array = array.map do |element|
      if element == '-'
        element = '123456789'
      else
        element
      end
    end
  end
 
 10.times {check_all_matches(board_array)} 

 # OR until board_array.join.length == 81
 # check_all_matches(board_array)
 # end

 board_array
end

def horizontal_match(board_array)

  board_array.each do |row|
    filled_cells = ""
       row.collect do |cell|
         filled_cells << cell if cell.length == 1
        end
       row.map do |cell|
       cell.delete!filled_cells if cell.length > 1
      end
  end
end

def vertical_match(board_array)
  horizontal_match(board_array.transpose)
end

def super_square_match(square)
    filled_cells = ""
    square.collect do |cell|
        filled_cells << cell if cell.length == 1
    end
    square.each do |cell|
        cell.delete!filled_cells if cell.length > 1
    end
end

def squares_match(board_array)
  first_square = [board_array[0][0], board_array[0][1], board_array[0][2],
                   board_array[1][0], board_array[1][1], board_array[1][2],
                   board_array[2][0], board_array[2][1], board_array[2][2]]
  second_square = [board_array[0][3], board_array[0][4], board_array[0][5],
                   board_array[1][3], board_array[1][4], board_array[1][5],
                   board_array[2][3], board_array[2][4], board_array[2][5]]
  third_square = [board_array[0][6], board_array[0][7],board_array[0][8],
                   board_array[1][6], board_array[1][7], board_array[1][8],
                   board_array[2][6], board_array[2][7], board_array[2][8]]

  forth_square = [board_array[3][0], board_array[3][1], board_array[3][2],
                   board_array[4][0], board_array[4][1], board_array[4][2],
                   board_array[5][0], board_array[5][1], board_array[5][2]]
  fifth_square = [board_array[3][3], board_array[3][4], board_array[3][5],
                   board_array[4][3], board_array[4][4], board_array[4][5],
                   board_array[5][3], board_array[5][4], board_array[5][5]]
  sixth_square = [board_array[3][6], board_array[3][7], board_array[3][8],
                   board_array[4][6], board_array[4][7], board_array[4][8],
                   board_array[5][6], board_array[5][7], board_array[5][8]]

  seventh_square = [board_array[6][0], board_array[6][1], board_array[6][2],
                   board_array[7][0], board_array[7][1], board_array[7][2],
                   board_array[8][0], board_array[8][1], board_array[8][2]]
  eighth_square = [board_array[6][3], board_array[6][4], board_array[6][5],
                   board_array[7][3], board_array[7][4], board_array[7][5],
                   board_array[8][3], board_array[8][4], board_array[8][5]]
  ninth_square = [board_array[6][6], board_array[6][7], board_array[6][8],
                   board_array[7][6], board_array[7][7], board_array[7][8],
                   board_array[8][6], board_array[8][7], board_array[8][8]]                 


  all_squares = [first_square, second_square, third_square, forth_square, 
    fifth_square, sixth_square, seventh_square, eighth_square, ninth_square]
  all_squares.each {|square| super_square_match(square)}

end

def check_all_matches(board_array)
  horizontal_match(board_array)
  # puts "first #{board_array}"
  vertical_match(board_array)
  # puts "second #{board_array}"
  squares_match(board_array)
  # puts "third #{board_array}"
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  false
  true if board.join.length == 81
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
 board.each {|row| p row}
end
