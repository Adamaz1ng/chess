require 'byebug'
require_relative 'nullpiece'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    grid[0].map! { Piece.new("black") }
    grid[1].map! { Piece.new("black") }
    grid[2..5].each do |row|
      row.map! { NullPiece.new }
    end
    grid[6].map! { Piece.new("white") }
    grid[7].map! { Piece.new("white") }
  end

  # monkey patching bracket method to take array of x, y coords
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, input)
    row, col = pos
    @grid[row][col] = input
  end

  def move_piece(start_pos, end_pos)
    raise 'no piece at start position' if @grid[start_pos].is_a?(NullPiece)
    @grid[end_pos] = @grid[start_pos]
    @grid[start_pos] = NullPiece.new
  end

  def valid_move?(start_pos, end_pos)
    return false if end_pos.first > 7 || end_pos.last > 7

  end

end


# The Board class should have a #move_piece(start_pos, end_pos) method.
#This should update the 2D grid and also the moved piece's position.
#You'll want to raise an exception if:
#there is no piece at start_pos or
#the piece cannot move to end_pos.
