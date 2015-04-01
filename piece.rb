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

  def valid_moves
    moves.delete_if { |pos| self.move_into_check?(pos) }
  end

  def move_into_check?(pos)

    # duplicate the board
    dup_board = board.dup

    # check whether player is in check after the move
    # use #move! because #move only allows valid moves and
    # valid moves excludes moves that would put a player in check
    # (infinite loop!)
    dup_board.move!(self.position, pos)
    dup_board.in_check?(self.color)

    # returns true/false
  end

end
