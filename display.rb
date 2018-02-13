require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display

  attr_reader :cursor, :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
    play
  end

  def render
    system 'clear'
    @board.grid.each_with_index do |row, i|
      print "-----------------------------------------------------------------\n"
      print "|"
      row.each_with_index do |square, j|
        if @cursor.cursor_pos == [i, j]
          if square.piece.nil?
            print " " + "EMPTY".blue.on_red.blink + " |"
          else
            print " " + square.piece.to_s.blue.on_red.blink + " |"
          end
        elsif square.piece.nil?
          print "       |"
        else
          print " " + square.piece.to_s + " |"
        end
      end
      puts ""
    end
    print "-----------------------------------------------------------------\n"
    puts "cursor: #{@cursor.cursor_pos}"
    puts "SELECTED" if @cursor.selected
    STDIN.echo = false
  end

  def play
    stop = false
    until stop
      render
      @cursor.get_input
    end
  end

end

Display.new
