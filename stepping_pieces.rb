# must be included in Knight, King classes
require_relative 'piece.rb'

class SteppingPieces < Piece

  def moves
    moves = []
    move_diffs.each do |x, y|
      pos = [self.position[0] + x, self.position[1] + y]
      if self.board.valid_pos?(pos) && (board[pos].nil? || board[pos].color != self.color)
        moves << pos
      end
    end

    moves
  end
    
end
