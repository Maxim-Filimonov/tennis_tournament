require 'spec_helper'
require 'tournament/game'
describe Tournament::Game do
  it 'puts generic rule as the last rule to fallback on' do
    game = described_class.new('p1', 'p2')

    game.rules.last.should be_instance_of(Tournament::Rules::GenericRule)
  end

  it 'finds the first rule which applies' do
    rules = [
      instance_double('Tournament::Rules::GenericRule', applicable?: false),
      instance_double('Tournament::Rules::GenericRule', applicable?: true, display: 'second rule'),
      instance_double('Tournament::Rules::GenericRule', applicable?: true)
    ]
    game = described_class.new('p1', 'p2')
    game.rules = rules

    game.score.should eq('second rule')
  end
end
