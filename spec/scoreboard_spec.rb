require 'spec_helper'
require 'tournament/scoreboard'

describe Tournament::Scoreboard do
  it 'sets initial score for all players to 0' do
    scoreboard = described_class.new(['p1','p2'])

    scoreboard.scores['p1'].should eq(0)
    scoreboard.scores['p2'].should eq(0)
  end

  it 'adds up score when point wins a point' do
    scoreboard = described_class.new(['p1','p2'])

    scoreboard.pointWonBy('p1')

    scoreboard.scores['p1'].should eq(1)
  end

  it 'raises error when trying to score as invalid player and suggets valid playes' do
    scoreboard = described_class.new(['p1','p2'])

    expect { scoreboard.pointWonBy('i dont exists') }.to raise_error {|error|
      error.message.should include('p1')
      error.message.should include('p2')
    }
  end
end

