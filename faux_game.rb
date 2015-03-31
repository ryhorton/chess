# Instantiate a board in command line, then pass that board to this method


def testing(board)

  # move pawn in front of king up board
  board.move([3,1], [3,2])
  board.move([3,2], [3,3])

  # move king up, over, up to other side
  board.move([3,0], [3,1])
  board.move([3,1], [3,2])
  board.move([3,2], [4,2])
  board.move([4,2], [4,3])
  board.move([4,3], [4,4])
  board.move([4,4], [4,5])

  # king is now in check, facing opponent's pawns
end
