require_relative 'board'

class Piece
  attr_accessor :pos
  attr_reader :board, :color

  def initialize(color, board, pos)
    @pos = pos
    @board = board
    @color = color
  end

  def moves

  end

  def to_s
    " #{symbol} "
  end

end #class

module Slideable
  # move_dir = diagonal/horizontal/vertical/both/all

  def diagonal_dirs
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end

  def lateral_dirs
    [[1, 0], [0, 1], [-1, 0], [0, -1]]
  end

  def both_dirs
    [[1, 0], [0, 1], [-1, 0], [0, -1]] +
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end

  def moves
    moves = []
    move_dir.each do |dr, dc|
      moves += build_moves(dr, dc)
    end
    moves
  end

  def build_moves(dr, dc)
    row, col = pos
    moves = []

    while true
      row, col = row + dr, col + dc
      current_pos = [row, col]

      break unless board.valid_move?(current_pos)

      if board.empty?(current_pos)
        moves << current_pos
      else
        moves << current_pos if board[current_pos].color != self.color
        break
      end
    end

    moves
  end

  def move_dir
    raise "Move direction method not implemented"
  end
end #Slideable module

module Steppable

  def moves
    # BUT FOR knight_dir
    moves = []
    move_dir.each do |dr, dc|
      moves += build_moves(dr, dc)
    end

    moves
  end

  def build_moves(dr, dc)
    row, col = pos
    moves = []

    row, col = row + dr, col + dc
    current_pos = [row, col]

    if board.valid_move?(current_pos)
      moves << current_pos if board.empty?(current_pos)
      if !board.empty?(current_pos) && board[current_pos].color != self.color
        moves << current_pos
      end
    end

    moves
  end

  def move_dir
    raise "Move direction method not implemented"
  end

end #Steppable module

class Queen < Piece
  include Slideable

  def symbol
    "Q".colorize(color)
  end

  def move_dir
    both_dirs
  end
end

class Bishop < Piece
  include Slideable

  def symbol
    "B".colorize(color)
  end

  def move_dir
    diagonal_dirs
  end

end

class Rook < Piece
  include Slideable

  def symbol
    "R".colorize(color)
  end

  def move_dir
    lateral_dirs
  end

end

class Knight < Piece
  include Steppable

  def symbol
    "N".colorize(color)
  end

  def move_dir
    knight_dir
  end

  def knight_dir
    [[-2, -1],
    [-2, 1],
    [1, 2],
    [-1, 2],
    [2, 1],
    [2, -1],
    [-1, -2],
    [1, -2]]
  end

end

class King < Piece
  include Steppable

  def symbol
    "K".colorize(color)
  end

  def move_dir
    king_dir
  end

  def king_dir
    [[-1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1]]
  end

end

class Pawns < Piece
  def symbol
    "P"
  end

  def moves

  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
    @symbol = " "
    @color = :none
  end

  def moves
    []
  end

end
