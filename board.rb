require_relative 'piece.rb'

class Board

  attr_accessor :board

  def initialize(mid_game = false)
    @board = Array.new(8) { Array.new(8) }

    unless mid_game
      set_up_board
    end
  end

  def set_up_board
    back_row = [
      Rook,
      Knight,
      Bishop,
      King,
      Queen,
      Bishop,
      Knight,
      Rook
    ]

    back_row.each_with_index do |piece_class, idx|
      board[7][idx] = piece_class.new(:b, [7, idx], self)
      board[0][idx] = piece_class.new(:w, [0, idx], self)
    end

    pawn_row = [Pawn] * 8

    pawn_row.each_with_index do |pawn_class, idx|
      board[1][idx] = pawn_class.new(:w, [1, idx], self)
      board[6][idx] = pawn_class.new(:b, [6, idx], self)
    end
  end

  def [](pos)
    x, y = pos
    @board[x][y]   # allows you to do: board[pos] === board.[](pos)
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value  # allows you to do: self.[]=(value)
  end

  def valid_pos?(pos)
    pos.all? { |i| i.between?(0,7) }
  end

  def in_check?(color)
    king_pos = find_king(color)

    pieces.each do |piece|
      if piece.color != color && piece.moves.include?(king_pos)
        return true
      end
    end

    false
  end

  def find_king(color)
    pieces.each do |piece|
      if piece.is_a?(King) && piece.color == color
        return piece.position
      end
    end
  end

  def pieces
    # pieces = []

    # Array#compact => removes all nil's
    board.flatten.compact

    # board.each do |row|
    #   row.each do |cell|
    #     pieces << cell unless cell.nil?
    #   end
    # end
    #
    # pieces
  end

  def move(start, end_pos)
    if self[start].nil?
      raise "There is no piece to move at that position."
    elsif self[end_pos] && (self[end_pos].color == self[start].color)
      raise "You can't move into a position you already occupy."
    end
    # self.[]([1,2])
    # self.[]=(value)

    # checks whether the move is valid for the specified piece
    proposed_move = [end_pos[0] - start[0], end_pos[1] - start[1]]
    if self[start].valid_moves.include?(proposed_move)
      moving_piece = self[start]
      moving_piece.position = end_pos

      # if there is an opponent piece at end_pos, take it
      if self[end_pos] && self[end_pos].color != moving_piece.color
        self[end_pos].position = nil
      end

      # assign the moving piece to end_pos
      self[end_pos] = moving_piece
      self[start] = nil

    else
      raise "Invalid move!"
    end
  end

  def move!(start, end_pos)

  end

  def inspect
    "board"
  end

  def dup
    dup = Board.new

    pieces.each do |piece|
      dup[piece.position] = piece.class.new(piece.color, piece.position, dup)
    end

    dup
  end

end
