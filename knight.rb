require_relative 'stepping_pieces.rb'

class Knight < SteppingPieces

  def type
    "k"
  end

  def move_diffs
    # knight can move in "L"-shaped direction, e.g., up-up-up-right or left-left-left-down
    [
      [2, -1],
      [2, 1],
      [-1, 2],
      [1, 2],
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [1, -2]
    ]
  end

end
