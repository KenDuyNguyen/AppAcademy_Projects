require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor, :grid 
  def initialize(board)
    @grid = board
    @cursor = Cursor.new([0,0], board)
  end 
  
  def build_grid
    string_grid = grid.board.map.with_index { |row, i| row.map { |piece| piece.to_s } }
    row, col = cursor.cursor_pos
    string_grid[row][col] = string_grid[row][col].colorize(:red)
    string_grid
  end 
  
  def build_row(row, i)
    row.map.with_index do |piece, idx|
      color = colors(i, idx)
      piece.to_s.colorize(color) 
    end 
  end 
  
  def colors(row, col)
    if cursor.cursor_pos == [row, col] && cursor.selected
      checker = :red 
    elsif cursor.cursor_pos == [row, col]
      checker = :orange 
    else 
      checker = :blue
    end 
  end 
  
  def render 
    # system("clear")
    build_grid.each { |row| puts row.join }
  end 
  
  def move_cursor
    render 
    cursor.get_input
  end
end 