# coding: utf-8
require_relative 'sliding_pieces.rb'

class Rook < SlidingPieces

  def to_s
    self.color == :w ? "♖" : "♜"
  end

  def move_dirs
    straight_moves
  end

  def inspect
    type + " " + self.color.to_s
  end

end
