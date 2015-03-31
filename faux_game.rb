# Instantiate a board in command line, then pass that board to this method


def testing(board)

  # move (white) pawn in front of king up board
  board.move([1,3], [2,3])
  board.move([2,3], [3,3])
  #
  # # move (white) king up, over, up to other side
  board.move([0,3], [1,3])
  board.move([1,3], [2,3])
  board.move([2,3], [2,4])
  board.move([2,4], [3,4])
  board.move([3,4], [4,4])
  board.move([4,4], [5,4])
  p board[[5,4]].class

  # white king is now in check, facing black pawns
end
