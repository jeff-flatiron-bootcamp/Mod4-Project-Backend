Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users #, only: [:create, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'      
      get '/games', to: 'users#games'   
      post '/newgame', to: 'users#newgame'
      get '/user_games', to: 'users#user_games'
    end
  end
end
