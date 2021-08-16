Rails.application.routes.draw do
  # UI
  get 'home/index'
  root 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

    end
  end
end
