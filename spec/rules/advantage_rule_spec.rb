require 'spec_helper'
require 'tournament/rules/advantage_rule'

describe Tournament::Rules::AdvantageRule do
  it_behaves_like 'tournament rule'

  it 'is not applicable when less than 3 points scored by each side' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 0, 'p2' => 1}))

    rule.should_not be_applicable
  end
  it 'is not applicable when score difference is greater than one point' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 3, 'p2' => 5}))

    rule.should_not be_applicable
  end
  it 'is applicable when one player is ahead of other by one point' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 3, 'p2' => 4}))

    rule.should be_applicable
  end

  it 'display name of highest scorer' do
    rule = described_class.new(instance_double('Scoreboard', scores: {'p1' => 3, 'p2' => 4}))

    rule.display.should eq('Advantage p2')
  end
end
