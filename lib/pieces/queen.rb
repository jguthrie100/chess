require_relative 'piece'

class Queen < Piece

  def initialize(color, position)
    super
    @move_dirs = [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]]
    @attack_move_dirs = @move_dirs
    @repeat_move = true
  end
end
