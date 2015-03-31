require_relative 'stepping_pieces.rb'

class Knight < SteppingPieces

  def type
    "k"
  end

  def move_dirs
    straight_moves
  end

end
