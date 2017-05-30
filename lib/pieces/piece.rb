class Piece
  attr_reader :moves, :color, :num_moves, :repeat_move

  def initialize(color)
    @color = color
    @moves = Array.new
    @num_moves = 0
  end

  def move
    @num_moves += 1
  end

  def attack_moves
    @moves
  end
end
