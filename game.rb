#!/usr/bin/env ruby

require 'yaml'

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
    # self.play
  end

  def play
    puts "Pick your colors. Who's going first ('B' or 'W')?"
    player1_color = gets.chomp.downcase.to_sym

    player1 = HumanPlayer.new(player1_color)

    player2_color = [:b, :w].delete(player1_color).first
    player2 = HumanPlayer.new(player2_color)

    puts "Save your game at any time by typing 'S'."

    until board.checkmate?(player1.color) || board.checkmate?(player2.color)
      board.render
      player1.play_turn
      board.render
      player2.play_turn
    end

    board.checkmate?(player1.color) ? winner = player2 : winner = player1
    puts "Game over! Congratulations, #{winner}"
  end

  def save
    result_name = gets.chomp

    File.open("#{result_name}", "w") do |f|
      f.puts self.to_yaml
    end
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
      puts "Enter the coordinates of the piece you want to move, e.g., < 1 2 >:"
      start = gets.chomp

      # something here about saving game if the user types 'S'
      # if start.downcase == "s"
      # game.save

      # name the file
      # gets
      # result_name

     # if any error from any method called in here is raised, then rescue (below) will catch it

      start.split(' ').to_a.map(&:to_i)  # gives start = [x, y]

    rescue InvalidMoveError => e
      puts e.message
      retry
    end

    puts "Enter the coordinates of the space you want to move to:"
    end_pos = gets.chomp.split(' ').to_a

    # piece is moved
    board.move(start, end_pos)

    # players switch turns
    player == player1 ? player = player2 : player = player1
  end

end


# if game is saved, user will enter this at command line to revisit the game:
# $ ruby game.rb < saved game file name >

if __FILE__ == $PROGRAM_NAME
  case ARGV.count
  when 0
    Game.new.play
  when 1
    YAML.load_file(ARGV.shift).play
  end
end
