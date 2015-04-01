# coding: utf-8
# require_relative 'stepping_pieces.rb'

class Pawn < Piece # < SteppingPieces

  def to_s
    self.color == :w ? "♙" : "♟"
  end

  def moves
    moves = []

    # pawn can only step one space forward
    w_move = [self.position[0] + 1, self.position[1]]
    b_move = [self.position[0] - 1, self.position[1]]

    moves << (self.color == :w ? [w_move] : [b_move])

    # pawn can take two steps forward at first move (only)
    if self.color == :w && self.position[0] == 1
      moves << [self.position[0] + 2, self.position[1]]
    elsif self.color == :b && self.position[0] == 6
      moves << [self.position[0] - 2, self.position[1]]
    end
    #
    # pawn can step diagonally when taking an opponent's piece

    if self.color == :w && @board[[self.position[0] + 1, self.position[1] + 1]] && @board[[self.position[0] + 1, self.position[1] + 1]].color == :b
      moves << [self.position[0] + 1, self.position[1] + 1]
    elsif self.color == :w && @board[[self.position[0] + 1, self.position[1] - 1]] && @board[[self.position[0] + 1, self.position[1] - 1]].color == :b
      moves << [self.position[0] + 1, self.position[1] - 1]
    elsif self.color == :b && @board[[self.position[0] - 1, self.position[1] + 1]] && @board[[self.position[0] - 1, self.position[1] + 1]].color == :w
      moves << [self.position[0] + 1, self.position[1] + 1]
    elsif self.color == :b && @board[[self.position[0] - 1, self.position[1] - 1]] && @board[[self.position[0] - 1, self.position[1] - 1]].color == :w
      moves << [self.position[0] + 1, self.position[1] - 1]
    end

    moves
  end

end
