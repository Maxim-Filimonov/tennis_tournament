require 'spec_helper'
require 'tournament/rules/deuce_rule'

describe Tournament::Rules::DeuceRule do
  it_behaves_like 'tournament rule'

  it 'is not applicable when at least one player scored less than 3' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 2, 'p2' => 2}))

    rule.should_not be_applicable
  end
  it 'applicable when both players scored the same' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 4, 'p2' => 4}))

    rule.should be_applicable
  end
  it 'applicable when both players scored 3' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 3, 'p2' => 3}))

    rule.should be_applicable
  end

  it 'displays Deuce' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 4, 'p2' => 4}))

    rule.display.should eq('Deuce')
  end
end
