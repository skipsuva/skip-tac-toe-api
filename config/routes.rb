Rails.application.routes.draw do

  namespace :v1 do
    resources :games, only: [:create]

  end

end
