# coding: utf-8
require_relative 'stepping_pieces.rb'

class Pawn < SteppingPieces

  def to_s
    self.color == :w ? "♙" : "♟"
  end

  def move_diffs
    # general case: pawn can only step one space forward

    # special cases:
    # pawn can take two steps forward at first move (only)
    # pawn can step diagonally when taking an opponent's piece

    # if (position + [1, -1]) or (position + [1, 1]) is occupied by other player:
    # move_diffs << [1, -1], [1, 1]
    # else:

    [
      [1, 0]
    ]

  end

  # overwrite moves method that generate possible moves

end
