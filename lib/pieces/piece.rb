require 'byebug'

class Piece
  attr_reader :move_dirs, :color, :num_moves, :repeat_move, :position

  def initialize(color, position)
    unless [:black, :white].include?(color) && position =~ /^[A-H][1-8]$/
      throw ArgumentError
    end

    @color = color
    @position = position
    @move_dirs = Array.new
    @num_moves = 0
  end

  def move
    @num_moves += 1
  end

  def attack_moves
    moves(true)
  end

  def moves(attack=false)
    board = $board.board
    loc = $board.loc_to_array(@position)
    output = Array.new

    moves = @move_dirs
    moves = @attack_move_dirs if attack

    moves.each do |move|
      next_move = loc.dup
      loop do
        next_move = [next_move[0]+move[0], next_move[1] + move[1]]

        break if $board.get_piece(next_move) == -1

        if $board.get_piece(next_move).nil?
          output.push(next_move.dup) unless attack
          next if @repeat_move
        elsif $board.get_piece(next_move).color != @color && attack
          output.push(next_move.dup)
        end
        break
      end
    end
    return output
  end
end
