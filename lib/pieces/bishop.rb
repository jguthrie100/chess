require_relative 'piece'

class Bishop < Piece

  def initialize(color, position)
    super
    @move_dirs = [[1,1],[1,-1],[-1,-1],[-1,1]]
    @attack_move_dirs = @move_dirs
    @repeat_move = true
  end
end
