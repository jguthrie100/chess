# spec/piece_spec.rb
require 'pieces/piece'
require 'pieces/rook'
require 'pieces/knight'
require 'pieces/bishop'
require 'pieces/queen'
require 'pieces/king'
require 'pieces/pawn'

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
end

describe Knight do
  describe '#initialize' do
    it 'creates a new Knight object with the relevant attributes' do
      expect(Knight.new(:white, "F4")).to have_attributes(:color => :white, :position => "F4", :move_dirs => [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]], :move_count => 0, :repeat_move => false)
    end
  end
end

describe Bishop do
  describe '#initialize' do
    it 'creates a new Bishop object with the relevant attributes' do
      expect(Bishop.new(:black, "F2")).to have_attributes(:color => :black, :position => "F2", :move_dirs => [[1,1],[1,-1],[-1,-1],[-1,1]], :move_count => 0, :repeat_move => true)
    end
  end
end

describe Queen do
  describe '#initialize' do
    it 'creates a new Queen object with the relevant attributes' do
      expect(Queen.new(:white, "H1")).to have_attributes(:color => :white, :position => "H1", :move_dirs => [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]], :move_count => 0, :repeat_move => true)
    end
  end
end

describe King do
  describe '#initialize' do
    it 'creates a new King object with the relevant attributes' do
      expect(King.new(:black, "D6")).to have_attributes(:color => :black, :position => "D6", :move_dirs => [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]], :move_count => 0, :repeat_move => false)
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
end
