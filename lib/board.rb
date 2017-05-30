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
    if location.is_a?(String) && location =~ /^[A-H][1-8]$/
      return @board[loc_to_array(location)[0]][loc_to_array(location)[1]]
    elsif location.is_a?(Array) && location.length == 2 && location[0].to_s =~ /^[0-7]$/ && location[1].to_s =~ /^[0-7]$/
      return @board[location[0]][location[1]]
    else
      return -1
    end
  end

  def loc_to_array(location)
    if location =~ /^[A-H][1-8]$/
      return [location[0].ord-65, location[1].to_i-1]
    else
      return nil
    end
  end
end
