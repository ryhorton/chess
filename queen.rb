# coding: utf-8
require_relative 'sliding_pieces.rb'

class Queen < SlidingPieces

  def to_s
    self.color == :w ? "♕" : "♛"
  end

  def move_dirs
    diagonal_moves + straight_moves
  end

end
