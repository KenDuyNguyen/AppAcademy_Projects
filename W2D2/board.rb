require_relative "piece"
require_relative "display"

class Board
  attr_reader :board 
  
  def initialize
    @board = Array.new(8) { Array.new(8) {Piece.new} }
  end 
  
  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "There is no piece there"
    elsif not_valid_move #MAKE THIS METHOD LATER  
      raise "This is not a valid move"
    else 
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end 
  end 
  
  def [](pos)
    row, col = pos 
    @board[row][col]
  end 
  
  def []=(pos, piece)     
    row, col = pos
    @board[row][col] = piece 
  end 
  
  def valid_pos?(pos)
    pos.all? { |x| (0...board.length).cover?(x) }
  end 
end 

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  # b.render 
  # b.add_piece([0,0], Pawn.new)
  # b.move_piece([0,0], [1,0])
end 