require_relative "game.rb"
require_relative "board.rb"

class Card

  attr_accessor :value, :position

  def initialize(value)
    @value = value
    @position = :down
  end

  def hide
    @position = :down
  end

  def reveal
    @position = :up
  end

  def to_s
  end

  def ==
  end

end
