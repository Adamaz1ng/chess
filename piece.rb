class Piece
  attr_reader :piece
  def initialize(piece = nil)
    @piece = piece
    @moves = []
    @curr_pos = nil
  end
end
  
