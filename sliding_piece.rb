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
    res = [@curr_pos]
    if direction == :vert_horz
      VERT_HORZ_DIFFS.each do |diff|
        new_pos = add_diffs(@curr_pos, diff)
        until obstacle?(new_pos)
          if board[new_pos].color != self.color
            res << new_pos
            next
          else
            res << new_pos
          end
          new_pos = add_diffs(res.last, diff)
        end





  end

  def obstacle?(pos)
    board[pos].color == this.color || !board.valid_pos?(pos) ? true : false
  end

end
