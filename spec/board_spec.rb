# spec/board_spec.rb
require 'board'

describe Board do
  describe '#initialize' do
    board = Board.new
    it 'sets up a new chess board with black and white pieces' do
      expect(board.board[0][0]).to be_a(Rook)
      expect(board.board[0][0].color).to be(:white)
      expect(board.board[1][0]).to be_a(Knight)
      expect(board.board[2][0]).to be_a(Bishop)
      expect(board.board[3][0]).to be_a(Queen)
      expect(board.board[3][0].color).to be(:white)
      expect(board.board[4][0]).to be_a(King)
      expect(board.board[5][0]).to be_a(Bishop)
      expect(board.board[6][0]).to be_a(Knight)
      expect(board.board[7][0]).to be_a(Rook)

      expect(board.board[0][1]).to be_a(Pawn)
      expect(board.board[0][1].color).to be(:white)
      expect(board.board[1][1]).to be_a(Pawn)
      expect(board.board[2][1]).to be_a(Pawn)
      expect(board.board[3][1]).to be_a(Pawn)
      expect(board.board[4][1]).to be_a(Pawn)
      expect(board.board[4][1].color).to be(:white)
      expect(board.board[5][1]).to be_a(Pawn)
      expect(board.board[6][1]).to be_a(Pawn)
      expect(board.board[7][1]).to be_a(Pawn)

      expect(board.board[4][2]).to be_nil
      expect(board.board[4][3]).to be_nil
      expect(board.board[4][4]).to be_nil
      expect(board.board[4][5]).to be_nil

      expect(board.board[0][6]).to be_a(Pawn)
      expect(board.board[1][6]).to be_a(Pawn)
      expect(board.board[1][6].color).to be(:black)
      expect(board.board[2][6]).to be_a(Pawn)
      expect(board.board[3][6]).to be_a(Pawn)
      expect(board.board[4][6]).to be_a(Pawn)
      expect(board.board[5][6]).to be_a(Pawn)
      expect(board.board[5][6].color).to be(:black)
      expect(board.board[6][6]).to be_a(Pawn)
      expect(board.board[7][6]).to be_a(Pawn)

      expect(board.board[0][7]).to be_a(Rook)
      expect(board.board[1][7]).to be_a(Knight)
      expect(board.board[1][7].color).to be(:black)
      expect(board.board[2][7]).to be_a(Bishop)
      expect(board.board[3][7]).to be_a(Queen)
      expect(board.board[4][7]).to be_a(King)
      expect(board.board[4][7].color).to be(:black)
      expect(board.board[5][7]).to be_a(Bishop)
      expect(board.board[6][7]).to be_a(Knight)
      expect(board.board[7][7]).to be_a(Rook)
    end
  end

  describe '#get_piece' do
    board = Board.new
    it 'returns the piece in the specified location (using String identifier)' do
      expect(board.get_piece("A1")).to be_a(Rook)
      expect(board.get_piece("B1")).to be_a(Knight)
      expect(board.get_piece("A2")).to be_a(Pawn)
      expect(board.get_piece("A3")).to be_nil
      expect(board.get_piece("F7")).to be_a(Pawn)
      expect(board.get_piece("F8")).to be_a(Bishop)
      expect(board.get_piece("I8")).to eql(-1)
      expect(board.get_piece("A9")).to eql(-1)
      expect(board.get_piece("A-1")).to eql(-1)
      expect(board.get_piece("A10")).to eql(-1)
    end

    it 'returns the piece in the specified location (using Array identifier)' do
      expect(board.get_piece([3,0])).to be_a(Queen)
      expect(board.get_piece([3,1])).to be_a(Pawn)
      expect(board.get_piece([2,7])).to be_a(Bishop)
      expect(board.get_piece([2,5])).to be_nil
      expect(board.get_piece([-1,5])).to eql(-1)
      expect(board.get_piece([1,8])).to eql(-1)
      expect(board.get_piece([10,5])).to eql(-1)
    end
  end

  describe '::loc_to_array' do
    it 'Converts the text location to an Array location' do
      expect(Board.loc_to_array("A1")).to eql([0, 0])
      expect(Board.loc_to_array("C6")).to eql([2, 5])
      expect(Board.loc_to_array("I1")).to be_nil
      expect(Board.loc_to_array("A12")).to be_nil
    end
  end

  describe '::array_to_loc' do
    it 'Converts the Array location to a text location' do
      expect(Board.array_to_loc([0,1])).to eql("A2")
      expect(Board.array_to_loc([6,2])).to eql("G3")
      expect(Board.array_to_loc([8,2])).to be_nil
      expect(Board.array_to_loc([0,-1])).to be_nil
    end
  end
end
