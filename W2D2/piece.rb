require "singleton"

class Piece
  def initialize(color, pos, board)
    @pos = pos
    @color = color 
    @board = board
  end 
  
  def to_s
    " o "
  end
end

class NullPiece < Piece
  include Singleton
end

class King < Piece
  include SteppingPiece

  def initialize(color, pos, value = 100)
    super
    @value = value
  end

  def move_dir
    direction = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, 1], [1, -1], [-1, -1]]
    moves(direction)
  end
end

class Queen < Piece 
  include SlidingPiece
  
  def initialize(color, pos, value = 9)
    super
    @value = value 
  end 
  
  def move_dir
    direction = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, 1], [1, -1], [-1, -1]]
    moves(direction)
  end 
end 

class Rook < Piece 
  include SlidingPiece
  
  def initialize(color, pos, value = 5)
    super
    @value = value 
  end 
  
  def move_dir
    all_moves = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    moves(all_moves)
  end 
end 

class Bishop < Piece 
  include SlidingPiece
    
  def initialize(color, pos, value = 3)
    super
    @value = value 
  end 
  
  def move_dir
    all_moves = [[-1, -1], [-1, 1], [1, 1], [1, -1]]
    moves(all_moves)
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(color, pos, value = 3)
    super
    @value = value
  end
  
  def move_dir
    all_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    moves(all_moves)
  end
end
 
class Pawn < Piece 
  def initialize(color, pos, value = 1)
    super
    @value = value
  end

  def moves
    
  end
end  

module SlidingPiece
  def moves(direction)
    available_moves = []

    direction.each do |dir|
      temp = [self.pos[0] + dir[0], self.pos[1], dir[1]]

      while temp.in_range?
        available_moves << temp 
        temp = [temp[0] + dir[0], temp[1] + dir[1]]
      end
    end

    available_moves
  end

  def in_range?
    (0..7).cover?(self[0]) && (0..7).cover?(self[1])
  end
end

module SteppingPiece
  def moves(direction)
    available_moves = []

    direction.each do |dir|
      available_moves << [self.pos[0] + dir[0], self.pos[1] + dir[1]]
    end

    available_moves
  end
end

