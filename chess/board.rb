require 'byebug'
require_relative 'piece'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    setup_grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def setup_grid
    # full_rows = [0, 1, 6, 7]
    #
    # @grid.map!.with_index do |row, idx|
    #   if full_rows.include?(idx)
    #     row.map! { |col| col = Piece.new }
    #   else
    #     row
    #   end
    # end
    #
    setup_back_rows
  end

  def setup_back_rows

    # main = [Knight.new(:white, self, )]
    back_rows_idx = [0, 7]
    back_rows_idx.each do |row_idx|
      grid[row_idx].map.with_index do |square, col_idx|
        self[[row_idx, col_idx]] = King.new(:white, self, [row_idx, col_idx])
      end
    end

  end

  def empty?(pos)
    # FIX AFTER NILCLASS IMPLEMENTED
    self[pos].nil?
  end

  def in_bounds?(cursor_pos)
    cursor_pos.all? { |pos| pos.between?(0, 7) }
  end

  def valid_move?(pos)
    # debugger
    pos.all? { |square| square.between?(0,7) }
    # debugger
  end

  def move_piece(start_pos, end_pos)
    begin
      raise "No piece at start pos" if self[start_pos].nil?
      raise "The piece cannot move to end position" unless self[end_pos].nil?
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def start_pos_m
      puts "Enter a starting position to move from in the form: 'row, col'"
      start_pos = gets.chomp.split(",").map(&:to_i)
  end

  def end_pos_m
    puts "Enter a position to move to in the form: 'row, col'"
    end_pos = gets.chomp.split(",").map(&:to_i)
  end
end

# game = Board.new
