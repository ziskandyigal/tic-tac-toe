Rails.application.routes.draw do
  # UI
  root 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
