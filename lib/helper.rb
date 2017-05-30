require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/pawn'

module Helper

  def setup_board
    @board.length.times do |row_num|
      if row_num == 0 || row_num == 1
        color = :white
      elsif row_num == 6 || row_num == 7
        color = :black
      end

      if row_num == 0 || row_num == 7
        @board[row_num][0] = Rook.new(color)
        @board[row_num][1] = Knight.new(color)
        @board[row_num][2] = Bishop.new(color)
        @board[row_num][3] = Queen.new(color)
        @board[row_num][4] = King.new(color)
        @board[row_num][5] = Bishop.new(color)
        @board[row_num][6] = Knight.new(color)
        @board[row_num][7] = Rook.new(color)
      elsif row_num == 1 || row_num == 6
        @board[row_num].length.times do |i|
          @board[row_num][i] = Pawn.new(color)
        end
      end
    end
  end
end
