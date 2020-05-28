Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/current_user', to: 'application#current_user'
  get '/check_user', to: 'application#check_user'
  namespace :api do
    namespace :v1 do
      resources :users #, only: [:create, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'      
      get '/games', to: 'users#games'   
      post '/newgame', to: 'users#newgame'
      get '/user_games', to: 'users#user_games'
      get '/high_scores', to: 'users#high_scores'
      patch '/updategame', to: 'users#updategame'
      get '/user_high_scores', to: 'users#user_high_scores'
    end
  end
end
