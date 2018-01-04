require_relative '../lib/board'

RSpec.describe Board do

  context "#initialize" do
    it 'is initialized with four colors when Board is set to easy ' do
      board = Board.new('easy')
      expect(board.sequence.size).to eq(4)
    end

    it 'is initialized with six colors when Board is set to hard ' do
      board = Board.new('hard')
      expect(board.sequence.size).to eq(6)
    end


  end
end
