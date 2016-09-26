Rails.application.routes.draw do

  namespace :v1 do
    post '/create' => 'games#create'
    patch '/reset' => 'games#reset'
    patch '/player_move' => 'games#player_move'
  end

end
