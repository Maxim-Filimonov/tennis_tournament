require 'spec_helper'
require 'tournament/rules/winner_rule'

describe Tournament::Rules::WinnerRule do
  it_behaves_like 'tournament rule'

  it 'is not applicable when less than 3 points scored by each side' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 0, 'p2' => 2}))

    rule.should_not be_applicable
  end
  it 'is not applicable when score difference is less than two points' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 4, 'p2' => 5}))

    rule.should_not be_applicable
  end
  it 'is applicable when one player is ahead of other by two points' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 3, 'p2' => 5}))

    rule.should be_applicable
  end
  it 'display winner' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 3, 'p2' => 5}))

    rule.display.should eq('p2 wins')
  end
end
