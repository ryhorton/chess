# must be included in Bishop, Rook, Queen classes

class SlidingPieces < Piece

  STRAIGHT_MOVES = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1],
  ]

  DIAGONAL_MOVES = [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1, -1]
  ]

  def initialize(board, position)
    @board = board
    @position = position
  end

  def straight_moves
    STRAIGHT_MOVES
  end

  def diagonal_moves
    DIAGONAL_MOVES
  end

  def moves(valid_moves)
    moves = []

    move_dirs.each do

  end

end
