require_relative 'piece'

class Pawn < Piece

  attr_reader :attack_move_dirs

  def initialize(color, position)
    super
    if color == :white
      @move_dirs = [[0,1]]
      @attack_move_dirs = [[1,1],[-1,1]]
    else
      @move_dirs = [[0,-1]]
      @attack_move_dirs = [[1,-1],[-1,-1]]
    end

    @repeat_move = false
  end

  def move
    super
    @moves.pop if @moves.length > 1
  end
end
