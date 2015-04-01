# Instantiate a board in command line, then pass that board to this method

# initialize a new board Board.new(midgame) so that it is set up blank
# we place players around a king to test checkmate

# board = Board.new(midgame = true)

def testing_checkmate(board)

  test_pieces = [
    King.new(:w, [0,0], board),
    King.new(:b, [1,0], board),
    Queen.new(:b, [0,1], board)
  ]

  test_pieces.each do |test_piece|
    board[test_piece.position] = test_piece
  end

  board

end
