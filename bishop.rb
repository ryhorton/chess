# coding: utf-8
require_relative 'sliding_pieces.rb'

class Bishop < SlidingPieces

  def to_s
    self.color == :w ? "♗" : "♝"
  end
  
  def move_dirs
    diagonal_moves
  end

end
