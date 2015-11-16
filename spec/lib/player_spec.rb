require 'spec_helper'

describe Player do
  let(:player) { Player.new("Bart Simpson", "Catcher", "Simpson Slammers")}
  describe ".new" do
    it 'has a name' do
      expect(player.name).to eq("Bart Simpson")
    end

    it 'has a position' do
      expect(player.position).to eq("Catcher")
    end

    it 'has a team name' do
      expect(player.team_name).to eq("Simpson Slammers")
    end
  end

  describe "all" do
    it 'returns an array' do
      file = File.read('roster.json')
      teams_hash = JSON.parse(file)
      ary = Player.all
      expect(ary).to be_a(Array)
    end

    it 'fills an array with player objects' do
      file = File.read('roster.json')
      teams_hash = JSON.parse(file)
      ary = Player.all
      expect(ary.first).to be_a(Player)
    end
  end
end
