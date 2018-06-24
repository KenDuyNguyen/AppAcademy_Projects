require_relative "card.rb"
require_relative "game.rb"
require 'byebug'

class Board

  def initialize
    @board = Array.new(4) { Array.new(4) }
  end

  def populate
    cards = (1..8).to_a.shuffle
    positions = []
    i = 0
    while i < @board.length
      j = 0
      while j < @board.length
        positions << [i,j]
        j += 1
      end
      i += 1
    end
    positions = positions.shuffle
    self.create_cards(positions,cards)
  end

  def create_cards(positions, cards)
    debugger

    counter_p = 0
    counter_c = 0

    while counter_p < positions.length
      row1 = positions[counter_p][0]
      row2 = positions[counter_p + 1][0]
      column1 = positions[counter_p][1]
      column2 = postions[counter_p + 1][1]
      @board[row1][column1] = Card.new(cards[counter_c])
      @board[row2][column2] = Card.new(cards[counter_c])
      counter_c += 1
      counter_p += 2
    end
  end

  def render
    @board.each_with_index do |row, index1|
      row.each_with_index do |card, index2|
        if card.position == :up
          @board[index1][index2] = card.value
        else
          @board[index1][index2] = "X"
        end
      end
    end
    @board
  end

  def won?
    # @board.all? do |row|
    #   row.all? { |card| card.position == :up } == true
      p @board
      false

  end

  def reveal
  end

end
