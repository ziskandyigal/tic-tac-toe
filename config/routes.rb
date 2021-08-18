Rails.application.routes.draw do
  # UI
  root 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create destroy]
      resources :tokens, only: [:create]
      get 'games/wins' => 'games#wins'
      resources :games, only: %i[show index create]
 
    end
  end
end
