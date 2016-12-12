

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
   
  5.times {check_all_matches(board_array)} 

  # Or Until method
  # until board_array.join.length == 81
  #    check_all_matches(board_array)
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

   all_squares = [first_square, second_square, third_square]

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

end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end

a = '1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--'


puts "1 #{board_array}"

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
end#returnes updated_board_array

def vertical_match(board_array)
    horizontal_match(board_array.transpose)
end

# horizontal_match(board_array)
# p board_array
# vertical_match(board_array)
# p board_array
# def superbox(board_array, array_x, array_y)
#   corr_x = (array_x[0]..array_x[1]).to_a
#   corr_y = (array_y[0]..array_y[1]).to_a
#   corr = corr_x.product(corr_y)
#   corr.map { |x| p board_array[x.first][x.last]}
# end

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

   all_squares = [first_square, second_square, third_square]

  all_squares.each {|square| super_square_match(square)}

end

# superbox(board_array, [0,2], [0,2])
# superbox(board_array, [0,2], [3,5])
# superbox(board_array, [0,2], [6,8])

# def init (board_array)

#   board_array.horizontal_match
#   board_array.vertical_match
#   board_array.super_square_match
#
# end

# horizontal_match(board_array)
# p board_array
def check_all_matches(board_array)

    horizontal_match(board_array)
    puts "2 #{board_array}"
    vertical_match(board_array)
    puts "3 #{board_array}"
    p squares_match(board_array)
    puts "4 #{board_array}"

end

flatten_array = board_array.flatten
flatten_array.map!{ |x|x.to_i}
total_value = 0
while false
  flatten_array.map!{ |x|total_value += x}
  p total_value
  if total_value == 81
    true
  else
    check_all_matches(board_array)
  end
end
# board_array.transpose

