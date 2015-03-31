require_relative 'sliding_pieces.rb'

class Rook < SlidingPieces

  def type
    "r"
  end

  def move_dirs
    straight_moves
  end

  def inspect
    type + " " + self.color.to_s
  end

end
