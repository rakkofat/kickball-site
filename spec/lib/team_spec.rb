require 'spec_helper'

describe Team do
  let(:team) { Team.new("Simpson Slammers")}
  describe ".new" do
    it 'has a name' do
      expect(team.name).to eq("Simpson Slammers")
    end

    it 'has an array of players' do
      expect(team.players).to be_a(Array)
      expect(team.players.first).to be_a(Player)
    end
  end

  describe "all" do
    it 'returns an array of Team objects' do
      ary = Team.all
      expect(ary).to be_a(Array)
      expect(ary.first).to be_a(Team)
    end
  end
end
