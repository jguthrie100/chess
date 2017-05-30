require_relative 'piece'

class Bishop < Piece
  
  def initialize(color)
    super
    @moves = [[1,1],[1,-1],[-1,-1],[-1,1]]
    @repeat_move = true
  end
end
