Rails.application.routes.draw do
  # UI
  root 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create destroy show]
      resources :tokens, only: [:create]
      get 'games/wins' => 'games#wins'
      resources :games, only: %i[show index create]
      get 'comments/byemail' => 'comments#byemail'
      resources :comments, only: [:create]
    end
  end
  match "*path" => "home#index", via: [:get, :post]
end
