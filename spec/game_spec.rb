require 'tournament/game'
describe Tournament::Game do
  it 'combines score for both players' do
    game = described_class.new(['p1', 'p2'])
    game.pointWonBy('p1')
    game.pointWonBy('p2')
    game.pointWonBy('p2')
    game.score.should include('15-30')
  end
end
