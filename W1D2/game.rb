require_relative 'board.rb'
require_relative 'card.rb'

class Game
  attr_accessor :guess

  def initialize
    @board = Board.new()
  end

  def over?
    if @board.won? == true
      p "Congrats, you win!"
      true
    else
      false
    end
  end

  def play#we got 2 positions at the board
    self.guess_check(self.make_guess)
    @board.populate
    @board.render

  end

  def render
    @board.render
  end

  def prompt
  end

  def pos
  end

  def make_guess
    p "Please pick 2 positions: (eg: [[2,3], [0,1]])"
    guess = gets.chomp
    guess
  end

  def guess_check(guess)
    row1 = guess[0][0]
    row2 = guess[1][0]
    column1 = guess[0][1]
    column2 = guess[1][1]
    card1 = @board[row1][column1]
    card2 = @board[row2][column2]
    p "your first card has value #{card1.value}"
    p "your second card has value #{card2.value}"
    if card1.value == card2.value
      p "Your two guesses were a match!"
      @board[row1][column1].reveal
      @board[row1][column2].reveal
    else
      p "Sorry, not a match.  Try again!"
      @board[row1][column1].hide
      @board[row1][column2].hide
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new()
  game.play until game.over?
end
