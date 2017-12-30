require_relative '../lib/board'

RSpec.describe Board do

  context "#initialize" do
    it 'is initialized with four unique colors ' do
      board = Board.new
      expect(board.sequence.size).to eq(4)
    end

  end
end
