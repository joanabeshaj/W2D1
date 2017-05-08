require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board

  def initialize
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render(board)

  end
end
