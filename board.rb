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
    debugger
    raise 'no piece at start position' if self[start_pos].is_a?(NullPiece)
    raise 'invalid move' if !valid_move?(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def valid_move?(start_pos, end_pos)
    return false if !valid_pos?(end_pos)
    return false if self[start_pos].piece == self[end_pos].piece
    true
  end

  def valid_pos?(pos)
    return false if pos.any? { |el| el > 7 || el < 0 }
    true
  end

end
