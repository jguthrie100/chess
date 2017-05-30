require_relative 'piece'

class King < Piece
  
  def initialize(color)
    super
    @moves = [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]]
    @repeat_move = false
  end
end
