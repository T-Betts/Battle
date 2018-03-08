require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  enable(:sessions)

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:Player_1])
    player_2 = Player.new(params[:Player_2])
    $game = Game.new(player_1, player_2)
    redirect('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attacked' do
    @game = $game
    if @game.current_turn == @game.player_1
      @game.attack(@game.player_2)
    else
      @game.attack(@game.player_1)
    end
    @game.switch_turn
    erb(:attacked)
  end

   run! if app_file == $0
end
