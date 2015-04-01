# coding: utf-8
require_relative 'stepping_pieces.rb'

class Knight < SteppingPieces

  def to_s
    self.color == :w ? "♘" : "♞"
  end

  def move_diffs
    # knight can move in "L"-shaped direction, e.g., up-up-up-right or left-left-left-down
    [
      [2, -1],
      [2, 1],
      [-1, 2],
      [1, 2],
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [1, -2]
    ]
  end

end
