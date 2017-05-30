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
        @board[0][row_num] = Rook.new(color, "A#{row_num+1}")
        @board[1][row_num] = Knight.new(color, "B#{row_num+1}")
        @board[2][row_num] = Bishop.new(color, "C#{row_num+1}")
        @board[3][row_num] = Queen.new(color, "D#{row_num+1}")
        @board[4][row_num] = King.new(color, "E#{row_num+1}")
        @board[5][row_num] = Bishop.new(color, "F#{row_num+1}")
        @board[6][row_num] = Knight.new(color, "G#{row_num+1}")
        @board[7][row_num] = Rook.new(color, "H#{row_num+1}")
      elsif row_num == 1 || row_num == 6
        @board.length.times do |col_num|
          @board[col_num][row_num] = Pawn.new(color, "#{(col_num+65).chr}#{row_num+1}")
        end
      end
    end
    @board[0][2] = Pawn.new(:black, "A3")
  end
end
