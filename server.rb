require "sinatra"
require "json"
require_relative 'lib/player.rb'
require_relative 'lib/team.rb'

set :public_folder, File.join(File.dirname(__FILE__), "public")

use Rack::Session::Cookie, {
  secret: "change_me",
  expire_after: 86400 # seconds
}

get "/" do
  if session[:visit_count].nil?
    visit_count = 1
  else
    visit_count = session[:visit_count].to_i
  end

  session[:visit_count] = visit_count + 1

  "You've visit this page #{visit_count} time(s).\n"
end

get "/teams" do
  @teams = Team.all
  erb :index, :layout => :layout
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
  @position_name = params[:position_name]
  @position_players = {}
  Team.all.each do |team|
    player = team.players.find { |p| p.position == @position_name }
    @position_players[player.name] = team.name
  end
  erb :position
end
