class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end 
  
  def move_piece(start_pos, end_pos)
    if start_pos.empty?
      raise "There is no piece there"
    elsif not_valid_move 
      raise "This is not a valid move"
    else 
      
    end 
  end 
  
  def [](pos)
    row, col = pos 
    @board[row][col]
  end 
  
  def []=(pos) 
    row, col
  end 
end 

class Piece
  def initialize(location)
    @location = location
  end 
end