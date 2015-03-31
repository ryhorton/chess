require_relative 'piece.rb'

class Rook < SlidingPieces

  def type
    "R"
  end

  def move_dirs
    straight_moves
  end

end
