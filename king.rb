require_relative 'stepping_pieces.rb'

class King < SteppingPieces

  def type
    "K"
  end

  def move_diffs
    # king can move 1 space in all 8 directions
    [
      [-1, 0],
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 1],
      [1, 1],
      [1, -1],
      [-1, -1]
    ]
  end

end
