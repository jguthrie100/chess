require 'byebug'

class Piece
  attr_reader :move_dirs, :attack_move_dirs, :color, :move_count, :repeat_move, :position

  def initialize(color, position)
    raise ArgumentError.new("Color of chess piece is not valid (must be :white or :black)") unless [:black, :white].include?(color)
    raise ArgumentError.new("Position of chess piece is not a valid chessboard position") unless position =~ /^[A-H][1-8]$/

    @color = color
    @position = position
    @move_dirs = Array.new
    @move_count = 0
  end

  def move
    @move_count += 1
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

    move_dirs.each do |move_dir|
      next_move = loc.dup

      loop do
        next_move = [next_move[0]+move_dir[0], next_move[1] + move_dir[1]]

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
