require_relative 'stepping_pieces.rb'

class Pawn < SteppingPieces

  def type
    "p"
  end

  def move_diffs
    # pawn can only step directly forward unless it is taking a piece,
    # then it can step diagonally

    # if (position + [1, -1]) or (position + [1, 1]) is occupied by other player:
    # move_diffs << [1, -1], [1, 1]
    # else:

    [
      [1, 1]
    ]

  end

end
