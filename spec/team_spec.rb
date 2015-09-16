require 'team'

describe Team do

  it 'knows how many players it has' do
    subject.add :player
    expect(subject.player_count).to eq(1)
  end

  context 'correct number of players' do

    it 'knows when it has less than the minimum number of players' do
      5.times { subject.add :player }
      expect(subject.validate_team?).to eq(false)
    end

    it 'knows when it has the minimum number of players' do
      7.times { subject.add :player }
      expect(subject.validate_team?).to eq(true)
    end

    it 'knows when it has the maximum number of players' do
      11.times { subject.add :player }
      expect(subject.validate_team?).to eq(false)
    end

  end

  context 'correct gender ratio' do

    it 'is invalid when there are fewer than 2 men' do
      subject.add double(:player, male?: true)
      7.times { subject.add double(:player, male?: false) }
      expect(subject.validate_team?).to eq(false)
    end
  end



  
end
