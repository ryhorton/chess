class Piece

  attr_accessor

  def initialize(position, board)
    @position = position
    @board = board
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end


  def moves
    raise "Only implemented in the Piece subclasses!"
  end

end
