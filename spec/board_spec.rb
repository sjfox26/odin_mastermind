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

  context "#generate_feedback_code" do
    it 'gives the correct feedback to player after each guess' do
      board = Board.new('easy')
      board.sequence = ['yellow', 'orange', 'blue', 'green']
      expect(board.generate_feedback_code(['yellow', 'blue', 'brown', 'green'])).to eq(['red', 'red', 'white'])
    end

  end

  context "#get_player_sequence" do
    it "should call ask_for_sequence" do
      board = Board.new('easy')
      expect(board).to receive(:ask_for_sequence)

      board.get_player_sequence
    end
  end


  ##check if winning combo returns true
end
