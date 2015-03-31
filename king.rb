require_relative 'stepping_pieces.rb'

class King < SteppingPieces

  def type
    "K"
  end

  def move_dirs
    straight_moves + diagonal_moves
  end

end
