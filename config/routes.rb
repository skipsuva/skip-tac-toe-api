Rails.application.routes.draw do

  get'/' => 'v1/leaderboards#index'

  namespace :v1 do
    post '/create' => 'games#create'
    patch '/reset' => 'games#reset'
    patch '/player_move' => 'games#player_move'

    get '/leaderboard' => 'leaderboards#index'
  end

end
