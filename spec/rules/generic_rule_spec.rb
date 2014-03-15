require 'spec_helper'
require 'tournament/rules/generic_rule'

describe Tournament::Rules::GenericRule do
  it_behaves_like 'tournament rule' do
    subject { described_class.new(instance_double(:scoreboard)) }
  end

  it 'always applies' do
    rule = described_class.new(instance_double('scoreboard'))

    rule.apply?.should eq(true)
  end

  context 'individual scores display' do
    {0 => '0', 1 => '15', 2 => '30', 3 => '40', 666 => 'invalid score'}.each do |score, display|
      it "displays score #{score} as #{display}" do
        scoreboard = instance_double('scoreboard', scores: {'p1' => score})
        rule = described_class.new(scoreboard)

        rule.display.should eq(display)
      end
    end
  end
  it 'display scores joined with -' do
    scoreboard = instance_double('scoreboard', scores: {'p1' => 1, 'p2' => 1})
    rule = described_class.new(scoreboard)

    rule.display.should eq('15-15')
  end
end
