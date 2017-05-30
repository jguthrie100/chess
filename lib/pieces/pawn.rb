require_relative 'piece'

class Pawn < Piece

  attr_reader :attack_moves

  def initialize(color)
    super
    @moves = [[0,1],[0,2]]
    @attack_moves = [[1,1],[-1,1]]
    @repeat_move = false
  end

  def move
    super
    @moves = [[0,1]]
  end
end
