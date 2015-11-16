class Player
  require 'json'

  attr_reader :name, :position, :team_name

  def self.all
    file = File.read('roster.json')
    teams_hash = JSON.parse(file)
    all_players = []
    teams_hash.each do |team, roster|
      roster.each do |position, player|
        all_players << Player.new(player, position, team)
      end
    end
    all_players
  end

  def initialize(name, position, team_name)
    @name = name
    @position = position
    @team_name = team_name
  end
end
