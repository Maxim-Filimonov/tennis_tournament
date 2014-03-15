shared_examples 'tournament rule' do
  subject { described_class.new(instance_double('Scoreboard', scores: {'p1' => 1, 'p2' => 3})) }
  it { should respond_to(:apply?).with(0).arguments }
  it { should respond_to(:display).with(0).arguments }
end
