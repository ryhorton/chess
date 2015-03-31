#!/usr/bin/env ruby

require 'yaml'

if __FILE__ == $PROGRAM_NAME

  case ARGV.count
  when 0
    MinesweeperGame.new.play
  when 1
    YAML.load_file(ARGV.shift).play
  end
end
