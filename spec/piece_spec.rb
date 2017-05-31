# spec/piece_spec.rb
require 'pieces/piece'
require 'pieces/rook'
require 'pieces/knight'
require 'pieces/bishop'
require 'pieces/queen'
require 'pieces/king'
require 'pieces/pawn'

# Initialize test board
board = Array.new(8) { Array.new(8) }
board[0][0] = Rook.new(:white, "A1")
board[0][4] = Rook.new(:black, "A5")
board[0][7] = Rook.new(:black, "A8")
board[1][0] = Knight.new(:white, "B1")
board[1][1] = Pawn.new(:white, "B2")
board[1][2] = Pawn.new(:black, "B3")
board[2][2] = Pawn.new(:black, "C3")
board[3][0] = Queen.new(:white, "D1")
board[3][7] = Queen.new(:black, "D8")
board[5][6] = Knight.new(:black, "F7")
board[6][4] = Bishop.new(:white, "G5")
board[7][1] = Pawn.new(:white, "H2")
board[7][4] = King.new(:black, "H5")
board[7][5] = Pawn.new(:black, "H6")

$board = Board.new
$board.board = board

describe Piece do
  describe '#initialize' do
    it 'creates a new Piece object with the relevant attributes' do
      expect(Piece.new(:black, "A1")).to have_attributes(:color => :black, :position => "A1", :move_dirs => [], :move_count => 0)
      expect(Piece.new(:white, "H8")).to have_attributes(:color => :white, :position => "H8", :move_dirs => [], :move_count => 0)
    end

    context 'when given invalid arguments' do
      it 'throws an ArgumentError' do
        expect { Piece.new(:black, "R2") }.to raise_error(ArgumentError, "Position of chess piece is not a valid chessboard position")
        expect { Piece.new(:white, "A9") }.to raise_error(ArgumentError, "Position of chess piece is not a valid chessboard position")
        expect { Piece.new(:red, "A3") }.to raise_error(ArgumentError, "Color of chess piece is not valid (must be :white or :black)")
      end
    end
  end
end

describe Rook do
  describe '#initialize' do
    it 'creates a new Rook object with the relevant attributes' do
      expect(Rook.new(:black, "B1")).to have_attributes(:color => :black, :position => "B1", :move_dirs => [[1,0],[0,-1],[-1,0],[0,1]], :move_count => 0, :repeat_move => true)
    end
  end

  describe '#moves' do
    it 'returns a list of valid cells to move to' do
      expect($board.get_piece("A1").moves).to match_array([[0,1],[0,2],[0,3]])
      expect($board.get_piece("A5").moves).to match_array([[0,1],[0,2],[0,3],[0,5],[0,6],[1,4],[2,4],[3,4],[4,4],[5,4]])
      expect($board.get_piece("A8").moves).to match_array([[0,5],[0,6],[1,7],[2,7]])
    end
  end

  describe '#attack_moves' do
    it 'returns a list of valid cells with an opposing piece on that can be attacked' do
      expect($board.get_piece("A1").attack_moves).to match_array([[0,4]])
      expect($board.get_piece("A5").attack_moves).to match_array([[0,0],[6,4]])
      expect($board.get_piece("A8").attack_moves).to match_array([])
    end
  end
end

describe Knight do
  describe '#initialize' do
    it 'creates a new Knight object with the relevant attributes' do
      expect(Knight.new(:white, "F4")).to have_attributes(:color => :white, :position => "F4", :move_dirs => [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]], :move_count => 0, :repeat_move => false)
    end
  end

  describe '#moves' do
    it 'returns a list of valid cells to move to' do
      expect($board.get_piece("B1").moves).to match_array([[0,2],[3,1]])
      expect($board.get_piece("F7").moves).to match_array([[7,7],[4,4],[3,5]])
    end
  end

  describe '#attack_moves' do
    it 'returns a list of valid cells with an opposing piece on that can be attacked' do
      expect($board.get_piece("B1").attack_moves).to match_array([[2,2]])
      expect($board.get_piece("F7").attack_moves).to match_array([[6,4]])
    end
  end
end

describe Bishop do
  describe '#initialize' do
    it 'creates a new Bishop object with the relevant attributes' do
      expect(Bishop.new(:black, "F2")).to have_attributes(:color => :black, :position => "F2", :move_dirs => [[1,1],[1,-1],[-1,-1],[-1,1]], :move_count => 0, :repeat_move => true)
    end
  end

  describe '#moves' do
    it 'returns a list of valid cells to move to' do
      expect($board.get_piece("G5").moves).to match_array([[2,0],[3,1],[4,2],[5,3],[7,3],[5,5],[4,6]])
    end
  end

  describe '#attack_moves' do
    it 'returns a list of valid cells with an opposing piece on that can be attacked' do
      expect($board.get_piece("G5").attack_moves).to match_array([[7,5],[3,7]])
    end
  end
end

describe Queen do
  describe '#initialize' do
    it 'creates a new Queen object with the relevant attributes' do
      expect(Queen.new(:white, "H1")).to have_attributes(:color => :white, :position => "H1", :move_dirs => [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]], :move_count => 0, :repeat_move => true)
    end
  end

  describe '#moves' do
    it 'returns a list of valid cells to move to' do
      expect($board.get_piece("D1").moves).to match_array([[2,0],[4,0],[5,0],[6,0],[7,0],[2,1],[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[4,1],[5,2],[6,3]])
      expect($board.get_piece("D8").moves).to match_array([[1,7],[2,7],[4,7],[5,7],[6,7],[7,7],[2,6],[1,5],[3,6],[3,5],[3,4],[3,3],[3,2],[3,1],[4,6],[5,5]])
    end
  end

  describe '#attack_moves' do
    it 'returns a list of valid cells with an opposing piece on that can be attacked' do
      expect($board.get_piece("D1").attack_moves).to match_array([[3,7],[7,4],[1,2]])
      expect($board.get_piece("D8").attack_moves).to match_array([[3,0],[6,4]])
    end
  end
end

describe King do
  describe '#initialize' do
    it 'creates a new King object with the relevant attributes' do
      expect(King.new(:black, "D6")).to have_attributes(:color => :black, :position => "D6", :move_dirs => [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]], :move_count => 0, :repeat_move => false)
    end
  end

  describe '#moves' do
    it 'returns a list of valid cells to move to' do
      expect($board.get_piece("H5").moves).to match_array([[6,3],[7,3],[6,5]])
    end
  end

  describe '#attack_moves' do
    it 'returns a list of valid cells with an opposing piece on that can be attacked' do
      expect($board.get_piece("H5").attack_moves).to match_array([[6,4]])
    end
  end
end

describe Pawn do
  describe '#initialize' do
    it 'creates a new Pawn object with the relevant attributes' do
      expect(Pawn.new(:black, "D7")).to have_attributes(:color => :black, :position => "D7", :move_dirs => [[0,-1]], :attack_move_dirs => [[1,-1],[-1,-1]], :move_count => 0, :repeat_move => false)
      expect(Pawn.new(:white, "D2")).to have_attributes(:color => :white, :position => "D2", :move_dirs => [[0,1]], :attack_move_dirs => [[1,1],[-1,1]], :move_count => 0, :repeat_move => false)
    end
  end

  describe '#moves' do
    it 'returns a list of valid cells to move to' do
      expect($board.get_piece("B2").moves).to match_array([])
      expect($board.get_piece("B3").moves).to match_array([])
      expect($board.get_piece("C3").moves).to match_array([[2,1]])
      expect($board.get_piece("H2").moves).to match_array([[7,2],[7,3]])
      expect($board.get_piece("H6").moves).to match_array([])
    end
  end

  describe '#attack_moves' do
    it 'returns a list of valid cells with an opposing piece on that can be attacked' do
      expect($board.get_piece("B2").attack_moves).to match_array([[2,2]])
      expect($board.get_piece("B3").attack_moves).to match_array([])
      expect($board.get_piece("C3").attack_moves).to match_array([[1,1]])
      expect($board.get_piece("H2").attack_moves).to match_array([])
      expect($board.get_piece("H6").attack_moves).to match_array([[6,4]])
    end
  end
end
