require_relative '../lib/wizard'

RSpec.describe Wizard do
  wizard = Wizard.new

  context "#check_if_correct_sequence" do
    it 'returns false if the player guess is off' do
      wizard.instance_variable_set(:@player_guess_array, ['orange', 'brown', 'brown', 'white'])

      expect(wizard.check_if_correct_sequence).to be_falsey
    end

    #it 'returns true if the player guess is right' do

    #end



#    it 'returns foo as input' do
#      allow($stdin).to receive(:gets).and_return('foo')
#      name = $stdin.gets

#      expect(name).to eq('food') #results in error
#    end
  end
end