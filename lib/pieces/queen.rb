require_relative 'piece'

class Queen < Piece

  def initialize(color)
    super
    @moves = [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]]
    @repeat_move = true
  end
end
