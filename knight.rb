require_relative 'piece.rb'

class Knight < SteppingPiece

  def type
    "K"
  end

  def move_dirs
    horizontal_moves
  end
  
end
