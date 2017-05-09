require 'byebug'
require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  # passing in Board.new and requiring 'board'
  def initialize(board=Board.new)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def build_grid
    @board.grid.map.with_index do |row, r_idx|
      build_row(row, r_idx)
    end
  end

  def build_row(row, r_idx)
    row.map.with_index do |square, c_idx|
      colors_result = colors_for(r_idx, c_idx)
      square = square.to_s.colorize(colors_result)
    end
  end

  def colors_for(r_idx, c_idx)
    sum = (r_idx + c_idx)
    case
    when [r_idx, c_idx] == cursor.cursor_pos
      bg = :light_green
    when [r_idx, c_idx] == cursor.cursor_pos && cursor.selected
      bg = :red
    when sum.even?
      bg = :light_yellow
    when sum.odd?
      bg = :cyan
    end

    {background: bg}
  end


  def render
    # debugger
    while true
      system('clear')
      # debugger
      build_grid.each do |row|
        puts row.join("")
      end
      cursor.get_input
      # debugger
    end
  end

end

d = Display.new
d.render
