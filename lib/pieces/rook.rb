require_relative 'piece'

class Rook < Piece

  def initialize(color)
    super
    @moves = [[1,0],[0,-1],[-1,0],[0,1]]
    @repeat_move = true
  end
end
