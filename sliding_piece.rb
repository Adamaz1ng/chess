module SlidingPiece

  VERT_HORZ_DIFFS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  DIAG_DIFFS = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]

  def direction
    if self.type == :bishop
      :diag
    elsif self.type = :rook
      :vert_horiz
    else
      both
    end
  end


  def moves(direction)

  end

  def obstacle?


  end

end
