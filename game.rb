#!/usr/bin/env ruby

require 'yaml'

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
    board.play
  end

  def play
    puts "Pick your colors. Who's going first (B or W)?"
    player1_color = gets.chomp.downcase.to_sym

    player1 = HumanPlayer.new(player1_color)

    player2_color = [:b, :w].delete(player1_color).first
    player2 = HumanPlayer.new(player2_color)

    until board.checkmate?(player1.color) || board.checkmate?(player2.color)
      player1.play_turn
      player2.play_turn
    end

  end

  def save

  end

end


class HumanPlayer

  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def play_turn
    # player moves a piece
    begin
      puts "Enter the coordinates of the piece you want to move, e.g., 1 2:"
      start = gets.chomp.split(' ').to_a  # gives start = [x, y]
      rescue "That's not one of your pieces." if player.color != board[start].color
    end
    puts "Enter the coordinates of the space you want to move to:"
    end_pos = gets.chomp.split(' ').to_a

    # piece is moved
    board.move(start, end_pos)

    # players switch turns
    player == player1 ? player = player2 : player = player1
  end

end



if __FILE__ == $PROGRAM_NAME

  case ARGV.count
  when 0
    MinesweeperGame.new.play
  when 1
    YAML.load_file(ARGV.shift).play
  end
end
