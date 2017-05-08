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
    full_rows = [0, 1, 6, 7]

    @grid.map!.with_index do |row, idx|
      if full_rows.include?(idx)
        row.map! { |col| col = Piece.new }
      else
        row
      end
    end
    # full_rows.each do |row|
    #   grid[row].each_index do |idx|
    #     grid[row, idx] = Piece.new
    #   end
    # end

    grid
  end

  def valid_move?(start, finish)
    #place after second raise
    # valid_move?(start_pos, end_pos)
  end

  def move_piece(start_pos, end_pos)
    begin
      raise "No piece at start pos" if self[start_pos].nil?
      raise "The piece can not move to end position" unless self[end_pos].nil?
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    # rescue
    #
    #   retry
    # rescue
    #
    #   retry
    end
  end

  def start_pos_m
    # begin
      puts "Enter a starting position to move from in the form: 'row, col'"
      start_pos = gets.chomp.split(",").map(&:to_i)
    # # WRITE CONDITIONALS
    #   if invalid position because bad numbers
    #     raise BadNumberError
    #   elsif invalid position because not numbers
    #     raise NotNumberError
    #   end
    #
    # # WRITE ERROR MESSAGES
    # rescue BadNumberError
    #   puts "Please enter a position in the form: 'row, col'"
    #   retry
    # rescue NotNumberError
    #   puts "Please enter a position in the form: 'row, col'"
    #   retry
    # end
  end

  def end_pos_m
    puts "Enter a position to move to in the form: 'row, col'"
    end_pos = gets.chomp.split(",").map(&:to_i)
  end
end

game = Board.new
