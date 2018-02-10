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

end
