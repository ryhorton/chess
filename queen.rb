require_relative 'sliding_pieces.rb'

class Queen < SlidingPieces

  def type
    "Q"
  end

  def move_dirs
    diagonal_moves + straight_moves
  end

end
