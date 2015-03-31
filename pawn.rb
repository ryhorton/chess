require_relative 'stepping_pieces.rb'

class Pawn < SteppingPieces

  def type
    "p"
  end

  def move_dirs
    # pawn can only step forward unless it is taking a piece,
    # then it can step diagonally

    diagonal_moves + straight_moves


  end

end
