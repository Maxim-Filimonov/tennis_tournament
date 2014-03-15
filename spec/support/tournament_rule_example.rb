shared_examples 'tournament rule' do
  it { should respond_to(:apply?).with(0).arguments }
  it { should respond_to(:display).with(0).arguments }
end
