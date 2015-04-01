# must be included in Knight, King classes
require_relative 'piece.rb'

class SteppingPieces < Piece

  # STRAIGHT_MOVES = [
  #   [-1, 0],
  #   [0, 1],
  #   [1, 0],
  #   [0, -1],
  # ]
  #
  # DIAGONAL_MOVES = [
  #   [-1, 1],
  #   [1, 1],
  #   [1, -1],
  #   [-1, -1]
  # ]
  #
  # def straight_moves
  #   STRAIGHT_MOVES
  # end
  #
  # def diagonal_moves
  #   DIAGONAL_MOVES
  # end

  def moves
    moves = []
    move_diffs.each do |x, y|
      pos = [self.position[0] + x, self.position[1] + y]
      if self.board.valid_pos?(pos)
        moves << pos
      end
    end

    moves
  end

end
