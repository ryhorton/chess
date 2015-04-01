#!/usr/bin/env ruby

require 'yaml'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(:w)
    @player2 = HumanPlayer.new(:b)
    # self.play
  end

  def play
    player = @player1

    until board.checkmate?(@player1.color) || board.checkmate?(@player2.color)
      # calls the Board#to_s method because puts == put string
      # which has been overwritten to return a string rep of the baord
      puts board
      puts "#{player.color}'s turn:"
      return if maybe_save  # get out of method if player saved game

      player.play_turn(board)

      # players switch turns
      player = (player == @player1 ? @player2 : @player1)
    end

    board.checkmate?(player1.color) ? winner = player2 : winner = player1
    puts "Game over! Congratulations, #{winner}"
  end

  def maybe_save
    puts "wanna save (y/n)?"
    answer = gets.chomp.downcase
    if answer == "y"
      self.save
      return true # get out of the whole method
    end

    false
  end

  def save
    puts "Enter filename to save at:"
    filename = gets.chomp

    # equivalent: File.write(filename, YAML.dump(self))

    File.open("#{filename}", "w") do |f|
      f.puts self.to_yaml
    end
  end

end


class HumanPlayer
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def play_turn(board)
    begin
      puts "Enter the coordinates of the piece you want to move, e.g., < 1 2 >:"
      start = get_coord

      puts "Enter the coordinates of the space you want to move to:"
      end_pos = get_coord

      board.move(start, end_pos)
      # rescue will catch any error raised from any method called so far
    rescue InvalidMoveError => e
      puts e.message
      retry  # restarts method at 'begin'
    end
  end

  def get_coord
    coord_str = gets.chomp.split(' ').to_a.map(&:to_i)  # gives start = [x, y]
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
