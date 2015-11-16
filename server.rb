require "sinatra"
require "json"
require_relative 'lib/player.rb'
require_relative 'lib/team.rb'

set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/teams" do
  @teams = Team.all
  erb :index
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @team = Team.all.find { |t| t.name == @team_name }
  erb :team
end

get "/positions" do
  @positions = []
  Team.all.first.players.each { |p| @positions << p.position }
  erb :positions
end

get "/positions/:position_name" do
  # file = File.read('roster.json')
  # teams_hash = JSON.parse(file)
  @position_name = params[:position_name]
  @position_players = {}
  # teams_hash.each do |team, roster|
  #   player = roster[@position_name]
  #   @position_players[player] = team
  # end
  Team.all.each do |team|
    player = team.players.find { |p| p.position == @position_name }
    @position_players[player.name] = team.name
  end
  erb :position
end
