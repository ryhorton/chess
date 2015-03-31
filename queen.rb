require_relative 'pieces.rb'

class Queen < SlidingPieces


  def move_dirs
    diagonal_moves + straight_moves
  end

end
