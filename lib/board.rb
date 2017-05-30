# lib/board.rb
require_relative 'helper'

class Board
  include Helper

  attr_accessor :board
  attr_reader :game_move, :removed_pieces

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @removed_pieces = Array.new

    setup_board
  end

  def move(from, to)
    piece = get_piece(from)

    unless piece.nil?
    end
  end

  def get_piece(location)
    if location =~ /^[A-H][1-8]$/
      return @board[location[0].ord-65][location[1].to_i-1]
    else
      return nil
    end
  end
end
