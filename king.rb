# coding: utf-8
require_relative 'stepping_pieces.rb'

class King < SteppingPieces

  def to_s
    self.color == :w ? "♔" : "♚"
  end

  def move_diffs
    # king can move 1 space in all 8 directions
    [
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1],
      [0, -1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end

end
