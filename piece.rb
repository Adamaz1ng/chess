class Piece
  attr_reader :piece
  def initialize(board, piece = nil)
    @piece = piece
    @color = color
    @board = board
    @curr_pos = nil
  end

  def add_diffs(diff1, diff2)
    a, b = diff1
    c, d = diff2
    [a + c, b + d]
  end
end
