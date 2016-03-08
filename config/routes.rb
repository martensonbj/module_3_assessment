Rails.application.routes.draw do
  root 'home#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :items, defaults: {format: :json}
    end
  end

  get '/search', to: "searches#index"

end
