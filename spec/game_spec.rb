require_relative '../lib/game'

RSpec.describe Game do

  context "#initialize" do
    it 'is initialized with a game board sequence of type Array' do
      game = Game.new

      expect(game.board.sequence).to be_an_instance_of(Array)
    end
  end
end
