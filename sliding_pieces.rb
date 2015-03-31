# must be included in Bishop, Rook, Queen classes
require_relative 'piece.rb'

class SlidingPieces < Piece

  STRAIGHT_MOVES = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1],
  ]

  DIAGONAL_MOVES = [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1, -1]
  ]

  def straight_moves
    STRAIGHT_MOVES
  end

  def diagonal_moves
    DIAGONAL_MOVES
  end

  def moves
    moves = []
    move_dirs.each do |x, y|
      pos = [self.position[0] + x, self.position[1] + y]
      i = 1
      while self.board.valid_pos?(pos)
        # p self.board[pos]
        # p pos

        if board[pos].nil?
          moves << pos
        elsif board[pos].color != self.color
          moves << pos
          break
        else
          break
        end

        i += 1
        pos = [self.position[0] + (x * i), self.position[1] + (y * i)]
      end
    end

    moves
  end

end
