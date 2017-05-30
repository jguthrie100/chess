require_relative 'piece'

class Knight < Piece

  def initialize(color)
    super
    @moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
    @repeat_move = false
  end
end
