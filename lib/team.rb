class Team
  require 'json'

  def self.all
    file = File.read('roster.json')
    teams_hash = JSON.parse(file)
    all_teams = []
    teams_hash.each_key do |team|
      all_teams << Team.new(team)
    end
    all_teams
  end

  attr_reader :name, :players

  def initialize(name)
    @name = name
    @players = set_roster
  end

  def set_roster
    Player.all.find_all { |p| p.team_name == @name }
  end
end
