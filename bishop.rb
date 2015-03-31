require_relative 'sliding_pieces.rb'

class Bishop < SlidingPieces

  def type
    "B"
  end

  def move_dirs
    diagonal_moves
  end

end
