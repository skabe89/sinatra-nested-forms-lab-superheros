require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }


    get '/' do
        erb :super_hero
    end

    post '/team' do
        team_params = params[:team]
        @team = Team.new(team_params)

        heros_params = team_params[:heros]
        @heros = heros_params.each{|hero| Hero.new(hero)}
        
        erb :team
    end

end
