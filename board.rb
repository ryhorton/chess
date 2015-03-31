require_relative 'piece.rb'

class Board

  attr_accessor :board

  def initialize
    set_up_board
  end

  def set_up_board
    @board = Array.new(8) { Array.new(8) }

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
    pieces = []

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

  end

  def inspect
    "board"
  end

end
