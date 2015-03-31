class Piece

  attr_accessor :color, :position, :board

  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board

  end

  
  def moves
    raise "Only implemented in the Piece subclasses!"
  end

end
